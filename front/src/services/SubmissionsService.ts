/* eslint-disable @typescript-eslint/no-explicit-any */
import { fakeSubmissionReports } from "../mocks";
import type { SubmissionReport, TestCaseResult } from "../types";

/**
 * Simula uma chamada de API para buscar o relatório de submissão pelo submissionId.
 * @param submissionId id da submissão
 * @returns Promise<SubmissionReport | undefined>
 */
export async function getSubmissionReportBySubmissionId(
  submissionId: string
): Promise<SubmissionReport | undefined> {
  await new Promise((resolve) => setTimeout(resolve, 200));
  return fakeSubmissionReports.find((r) => r.submissionId === submissionId);
}
/**
 * Simula uma chamada de API para buscar uma submissão pelo id.
 * @param submissionId id da submissão
 * @returns Promise<Submission | undefined>
 */
export async function getSubmissionById(
  submissionId: string
): Promise<Submission | undefined> {
  await new Promise((resolve) => setTimeout(resolve, 200));
  return fakeSubmissions.find((s) => s.id === submissionId);
}
import type { Submission } from "../types";
import { fakeSubmissions } from "../mocks";
import axios from "axios";

const API_URL = (import.meta as any).env?.VITE_API_URL || "http://localhost:8000";

/**
 * Simula uma chamada de API para buscar todas as submissões.
 * @returns Promise<Submission[]>
 */
export async function getAllSubmissions(): Promise<Submission[]> {
  try {
    const response = await axios.get(`${API_URL}/api/submissoes`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("auth_token")}`,
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      withCredentials: true,
    });

    return response.data.map((submissao: any) => ({
      id: submissao.id,
      activityId: submissao.atividade_id,
      dateSubmitted: submissao.data_submissao,
      language: submissao.linguagem || "c",
      status: submissao.status || "pending",
    }));
  } catch (error) {
    console.log("erro", error);
  }

  return [];
}

export async function getResultBySubmissionId(
  submissionId: number
): Promise<TestCaseResult[]> {
  try {
    const response = await axios.get(
      `${API_URL}/api/correcao/busca-por-submissao/${submissionId}`,
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("auth_token")}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        withCredentials: true,
      }
    );
    return response.data.map((item: any) => ({
      id: item.id,
      testCaseId: item.caso_teste_id,
      status: item.status,
      submissionId: item.submissao_id,
    }));
  } catch (error) {
    console.log("erro", error);
  }
  return [];
}

export async function postSubmission({
  code,
  activityId,
}: {
  code: string;
  activityId: number;
}): Promise<Submission | undefined> {
  try {
    const response = await axios.post(`${API_URL}/api/submissoes`, {
      codigo: code,
      atividade_id: activityId,
    }, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("auth_token")}`,
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      withCredentials: true,
    });
    return response.data;
  } catch (error) {
    console.log("erro", error);
    throw error;
  }
  return undefined;
}

/**
 * Simula uma chamada de API para buscar submissões por activityId.
 * @param activityId id da atividade
 * @returns Promise<Submission[]>
 */
export async function getSubmissionsByActivityId(
  activityId: string
): Promise<Submission[]> {
  try {
    console.log("[Debug] Getting submissions for activity", activityId, "token:", localStorage.getItem("auth_token"));
    const response = await axios.get(
      `${API_URL}/api/submissoes/atividades/${activityId}`,
      {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("auth_token")}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        withCredentials: true,
      }
    );

    // debug: log the full response for inspection
    console.log("[Debug] Full response:", {
      status: response.status,
      statusText: response.statusText,
      headers: response.headers,
      data: response.data
    });

    // debug: log raw response shape for inspection
    console.log("[Debug] Raw response data:", JSON.stringify(response.data, null, 2));

    // ensure we're getting the submissions array from the response
    const submissions = response.data?.submissoes || [];
    console.log("[Debug] Extracted submissions:", submissions);

    const mapped = submissions.map((submissao: any) => ({
      id: submissao.id,
      activityId: submissao.atividade_id,
      dateSubmitted: submissao.data_submissao,
      language: submissao.linguagem || "c",
      status: submissao.status || "pending",
    }));

    console.log("[Debug] Mapped submissions:", mapped);
    return mapped;
  } catch (error) {
    console.log("erro ao buscar submissões por atividade", error);
  }

  return [];
}
