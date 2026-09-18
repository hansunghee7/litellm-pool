# LiteLLM API Pool - Work Summary & Handoff for Claude Code

## 1. 프로젝트 개요
- **목적**: 5개 주요 AI 프로바이더(Google Gemini, Groq, SambaNova, GitHub Models, OpenRouter)의 총 9개 API 키를 통합 관리하고, 429 Rate Limit 발생 시 6단계로 자동 우회(Failover)하는 고가용성 LLM API Pool 구축.
- **아키텍처**: LiteLLM 프록시 기반, 로컬 포트 `4000` (`http://localhost:4000/v1`) 및 Render 클라우드 배포 호환 구조.

## 2. 실측 성과 (Benchmark Results)
- **테스트 규모**: 연속 15회 요청 테스트 수행
- **성공률**: 100% (실패 0건)
- **평균 응답 속도 (Latency)**: 246.33ms
- **자동 우회(Failover) 검증**: 429 Rate Limit 발생 시 Fallback 모델(`gemini-2.5-flash-lite`, SambaNova, Groq 등)로 즉시 전환되어 중단 없이 성공 확인.

## 3. 로컬 환경 바인딩 및 연동 정보
- **환경변수 설정 (User Scope)**:
  - `OPENAI_BASE_URL="http://localhost:4000/v1"`
  - `OPENAI_API_KEY="sk-1234"`
- **LAN 공유 / 3대 기기 연동법**:
  - `set_hermes_env.ps1` 스크립트를 사용하여 다른 기기나 PC에서 동일한 엔드포인트로 손쉽게 연동 가능.

## 4. 생성 및 수정된 주요 파일 목록 (`C:\work\litellm-pool`)
- `config.yaml`: 9개 API 키 및 6단계 Fallback 라우터 설정 (Primary: Gemini 2.5 Flash -> Flash Lite -> SambaNova -> Groq -> GitHub -> OpenRouter)
- `set_hermes_env.ps1`: Windows 사용자 환경변수 영구 등록 자동화 스크립트
- `benchmark.py` / `benchmark_local.py`: 15회 연속 429 우회 실측 테스트 스크립트
- `DEPLOY_GUIDE.md`: Render Docker 및 PostgreSQL Admin UI(`/ui`) 배포 가이드

## 5. 향후 과제 (Claude Code용 남은 작업)
- Render 클라우드 상시 배포 및 Render PostgreSQL DB 연동 (`DATABASE_URL` 설정)을 통한 원격 API Pool 서비스 가동.
