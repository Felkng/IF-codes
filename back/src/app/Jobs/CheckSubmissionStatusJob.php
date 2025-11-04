<?php

namespace App\Jobs;

use App\Facades\Judge0;
use App\Models\Correcao;
use App\Models\Submissao;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Throwable;

class CheckSubmissionStatusJob implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    private const PENDING_STATUSES = [1, 2];
    private const RELEASE_DELAY_SECONDS = 1;

    private int $submissaoId;

    public function __construct(int $submissaoId)
    {
        $this->submissaoId = $submissaoId;
    }

    public function handle(): void
    {
        $submissao = Submissao::with('correcoes')->find($this->submissaoId);

        if (!$submissao) {
            Log::warning('Submissão não encontrada ao verificar status.', [
                'submissao_id' => $this->submissaoId,
            ]);

            return;
        }

        try {
            $resultados = Judge0::getResultados($submissao);
        } catch (Throwable $exception) {
            Log::error('Erro ao consultar resultados no Judge0.', [
                'submissao_id' => $this->submissaoId,
                'exception' => $exception->getMessage(),
            ]);

            throw $exception;
        }

        $possuiPendentes = false;

        foreach ($resultados as $resultado) {
            /** @var Correcao|null $correcao */
            $correcao = $submissao->correcoes->firstWhere('token', $resultado['token']);

            if (!$correcao) {
                Log::warning('Correção não encontrada para token retornado pelo Judge0.', [
                    'submissao_id' => $this->submissaoId,
                    'token' => $resultado['token'],
                ]);

                continue;
            }

            $statusId = $resultado['status_id'];

            if (in_array($statusId, self::PENDING_STATUSES, true)) {
                $possuiPendentes = true;
                continue;
            }

            $correcao->status_correcao_id = $statusId;
            $correcao->save();
        }

        if ($possuiPendentes) {
            $this->release(self::RELEASE_DELAY_SECONDS);
        }
    }
}
