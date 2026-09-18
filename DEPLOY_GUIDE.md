# Render LiteLLM API Pool Deployment Guide

## 1. Render Web Service 설정
- **Repository**: `https://github.com/hansunghee7/litellm-pool`
- **Runtime**: `Docker`
- **Region**: 가장 가까운 지역 선택 (예: Singapore 또는 Oregon)
- **Branch**: `master`

## 2. 필수 환경 변수 (Environment Variables)
Render Web Service 설정 화면에서 아래 환경 변수들을 추가하세요:
- `LITELLM_MASTER_KEY`: `sk-your-secure-master-key-here` (관리자 및 API 인증용)
- `LITELLM_SALT_KEY`: 임의의 비밀 키 문자열
- `DATABASE_URL`: Render에서 무료 PostgreSQL을 생성한 뒤 제공되는 내부 연결 문자열 (Admin UI 활성화 및 키 영구 저장을 위해 필수)
- `GEMINI_API_KEY`: Google Gemini API 키
- `SAMBANOVA_API_KEY`: SambaNova API 키
- `GROQ_API_KEY`: Groq API 키
- `GITHUB_TOKEN`: GitHub Personal Access Token
- `OPENROUTER_API_KEY`: OpenRouter API 키

## 3. 검증 (Health Check & Admin UI)
배포 완료 후:
- **Health Check**: `curl https://<your-app-name>.onrender.com/health`
- **Admin UI**: 브라우저에서 `https://<your-app-name>.onrender.com/ui` 접속 후 `LITELLM_MASTER_KEY`로 로그인

## 4. 로컬 PC/노트북(3대 기기) Hermes 연동 자동화
생성된 `set_hermes_env.ps1` 스크립트를 관리자 권한 PowerShell에서 실행하여 환경변수를 등록합니다:
```powershell
.\set_hermes_env.ps1 -RenderUrl "https://<your-app-name>.onrender.com" -MasterKey "sk-your-secure-master-key-here"
```
