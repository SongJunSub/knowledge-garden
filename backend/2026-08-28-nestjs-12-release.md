---
title: "NestJS v12.0.0 릴리스 (kamilmysliwiec): ESM 전환을 선택 사항으로 만든 설계가 이 릴리스의 진짜 성취다. 그리고 릴리스 노트가 가장 조용히 말하는 것은 프레임워크에 1급 계측 훅이 생기고 거기에 자사 유료 SaaS가 꽂혔다는 것"
source_title: "NestJS v12.0.0"
source_url: "https://github.com/nestjs/nest/releases/tag/v12.0.0"
source_name: "GitHub Releases (nestjs/nest, kamilmysliwiec)"
referrer_url: "https://github.com/nestjs/nest/releases/tag/v12.0.0"
published_at: "2026-08-27"
summarized_at: "2026-08-28"
category: "backend"
tags: ["nestjs", "esm", "standard-schema", "observability", "vendor-lock-in", "migration", "breaking-changes", "nodejs"]
---

# NestJS v12.0.0 릴리스 (nestjs/nest)

> 출처: [NestJS v12.0.0](https://github.com/nestjs/nest/releases/tag/v12.0.0) (작성자 kamilmysliwiec · 2026-08-27 12:23 UTC 게시 · GitHub Releases) · 정리일 2026-08-28
> **릴리스한 쪽이 쓴 릴리스 노트**다. 즉 **가장 좋게 쓰인 판본**이고 불리한 프레이밍은 없다.
> **hada·HN 토론을 찾지 못했다.** GitHub 리액션 **총 114**(👍32 🎉31 🚀22 ❤️19 😄6 👀4, **👎0**)뿐인데 **리액션 수는 만족도가 아니라 노출**이다. 게시 하루째라 **실전 업그레이드 후기가 사실상 없다.**
> **`@nestjs/observe` 의 요금제·셀프호스팅·OTel 관계는 릴리스 노트에 없어서 공식 문서에서 따로 확인**했다(→ 전이 1).

## 한 줄 요약

**NestJS 12 는 네 축이다. 모든 공식 패키지의 ESM 전환, 검증과 직렬화의 Standard Schema 1급 지원, ESM·Vitest 로 다시 만든 CLI, 그리고 `@nestjs/observe` 라는 네이티브 관측성. Node 20.19+ 또는 22.12+ 를 요구하고, 그 대가로 `require(esm)` 덕분에 기존 CommonJS 앱은 대체로 그대로 돈다. 이 릴리스에서 설계로 가장 잘한 건 ESM 전환을 강제하지 않은 것이다. 패키지는 ESM 인데 내 앱은 CJS 로 남아도 되고, `nest upgrade` 는 의도적으로 ESM·Vitest·oxlint 로 옮기지 않는다. 새 기본값은 새 프로젝트에만 적용하고 기존 프로젝트는 자기 일정으로 간다. 그런데 릴리스 노트가 가장 조용히 말하는 게 하나 있다. `instrument` 라는 애플리케이션 옵션이 새로 생겼고 거기에 Nest 팀의 자사 SaaS 가 꽂힌다. 노트는 이걸 "돌릴 컬렉터가 없다"는 장점으로 쓰는데, 컬렉터가 없는 게 아니라 벤더 쪽에 있다는 뜻이고, 공식 문서에는 요금제가 있고 셀프호스팅 옵션이 없고 OpenTelemetry 언급이 없다.**

## 핵심 포인트

**전제와 업그레이드 경로**
- **Node.js v20.19+ 또는 v22.12+ 필수.** `require(esm)` 과 ESM 패키지 둘 다 여기 의존하고, **업그레이드 명령이 구버전에서는 실행을 거부**한다(**21.x 라인 미지원**).
- `npm i -g @nestjs/cli@latest` 후 `nest upgrade`(alias `update`). **모든 `@nestjs/*` 를 v12 호환 메이저로 한 번에 올리고** 기계적인 마이그레이션을 적용한다: `nest-cli.json` webpack 옵션, GraphQL `playground` → `graphiql` 개명과 구독 전송 교체, NATS 패키지 교체, `@nestjs/config` 검증 옵션, Jest·Joi 버전 상향.
- 그리고 ***"바꾼 것 전부와 아직 손으로 검토해야 할 것 전부를 리포트로 출력"***한다. **`--dry-run` 을 먼저 돌리면 파일을 건드리지 않고 그 리포트만 본다.**
- ***"It deliberately does not migrate your project to ESM, Vitest, or oxlint."*** 그것들은 **새로 생성한 프로젝트의 기본값**이고 ***"기존 프로젝트는 자기 일정으로 채택한다."***

**ESM 패키지**
- 코어 패키지 전부 ESM 으로 배포. **`require(esm)` 덕분에 대부분의 기존 CJS 앱은 재작성 없이 계속 동작.**
- 단, **커스텀 부트스트랩 스크립트·빌드 도구·테스트 러너가 CJS 전용을 가정한다면 검토** 필요.
- `nest new` 가 **CommonJS 냐 ESM 이냐를 물어본다.**

**Standard Schema 검증**
- `@Body()` `@Query()` `@Param()` `@RawBody()` 가 **`schema` 옵션**을 받는다. Zod·Valibot·ArkType 등 [Standard Schema](https://standardschema.dev/) 호환 라이브러리 대상.
  ```ts
  @Post()
  create(@Body({ schema: createUserSchema }) body: CreateUserDto) { ... }

  @Get(':id')
  findOne(@Param('id', { schema: z.coerce.number().int().positive() }) id: number) { ... }
  ```
- **데코레이터는 메타데이터만 붙인다.** 실제 검증은 `app.useGlobalPipes(new StandardSchemaValidationPipe())` 를 등록해야 돈다.
- **같은 스키마가 OpenAPI 생성에도 쓰인다.**
- ***"데코레이터 기반 class-validator 워크플로는 완전히 지원되며 제거 계획이 없다."***

**Standard Schema 직렬화**
- `StandardSchemaSerializerInterceptor` + `@SerializeOptions({ schema })` 로 응답을 검증·변환.
- 선택 기준을 릴리스가 직접 준다: **클래스 기반 DTO 면 `ValidationPipe`/`ClassSerializerInterceptor`, 스키마가 이미 있으면 Standard Schema 변형.**

**`@nestjs/observe`**
- **`instrument` 라는 애플리케이션 옵션**을 통해 Nest 자체 요청 라이프사이클에 꽂힌다. ***"generic APM 에이전트처럼 HTTP 서버를 패치하는 대신."***
  ```ts
  export const { ObserveModule, ObserveInstrument } = createObserveModule();
  const app = await NestFactory.create(AppModule, { instrument: ObserveInstrument });
  ```
- 자동 계측 범위: **HTTP·GraphQL·gRPC·마이크로서비스 전송 + 큐 컨슈머 + cron 실행.** ***"수동 span 배선도 없고 돌릴 collector 도 없다."***
- **`nest new` / `nest upgrade` 가 `--observe` 로 배선까지 해준다.** 옵트인이고 새 기능이라 마이그레이션할 것은 없다.

**Config 모듈이 Standard Schema 로**
- `@nestjs/config` 의 `validationSchema` 가 **Joi 전용에서 임의의 호환 스키마로.**
- 기존 Joi 는 **두 가지 단서와 함께** 계속 동작: **Joi v18+ 로 올리고**(Standard Schema 를 구현한 첫 릴리스), **라이브러리 전용 설정을 `validationOptions.libraryOptions` 아래로** 옮긴다.

**라우트 충돌 진단(옵트인)**
- 라우트는 **선언 순서대로 등록**되므로 순서 민감 어댑터에서 `@Get(':id')` 가 **뒤에 선언된 `@Get('me')` 를 조용히 가릴 수 있다.**
  ```ts
  NestFactory.create(AppModule, {
    routeConflictPolicy: { duplicate: 'error', shadow: 'warn' },
    routeResolutionStrategy: 'specificity',
  });
  ```
- **둘 다 기본값은 이전 동작**이라 설정하지 않으면 아무것도 바뀌지 않는다.

**기계 판독 가능한 에러 코드**
- `HttpExceptionOptions` 가 **`errorCode`** 를 받아 응답 바디에 직렬화한다. ***"클라이언트가 메시지 문자열을 파싱하는 대신 안정적인 식별자로 분기."***
  ```ts
  throw new BadRequestException('Password is too weak', { errorCode: 'WEAK_PASSWORD' });
  ```

**구조화 로깅 params**
- `ConsoleLogger` 가 메시지 뒤의 **평범한 객체를 별도 레코드가 아니라 같은 로그 항목의 구조화 params 로** 취급. JSON 모드에서 `params` 아래 중첩되거나 `flattenParams` 로 루트에 펼쳐진다. **기본 on**, `structuredParams: false` 로 복구.

**CLI v12**
- [nestjs/nest-cli#3280](https://github.com/nestjs/nest-cli/pull/3280) 에서 **전면 재작성**: 소스 전체 ESM 화, **Jest → Vitest**, **모든 명령에 e2e 테스트 추가**, 명령 클래스가 **타입 없는 입력·옵션 배열 대신 타입 있는 컨텍스트 객체**를 받도록 리팩토링.
- 새 명령: **`nest upgrade`**, **`nest deploy`**(**Mau** 경유 클라우드 배포, 첫 사용 시 `@nestjs/mau` 설치 후 인자를 그대로 전달).
- 기본값 변경: **모노레포 기본 번들러가 Rspack**(`--webpack`/`--webpackPath` 및 `nest-cli.json` 대응 항목 **deprecated**, `--builder rspack` 으로), 생성 프로젝트의 **ESLint → oxlint**, **ESM 프로젝트 기본 테스트 러너 Vitest**(CJS 는 Jest 유지), **bun 이 패키지 매니저로 추가**.
- `decorator` 스키매틱이 **`Reflector.createDecorator()` 형태**로 생성. **`angular` 스키매틱 제거.**
- 새 옵션: `--rspackPath`, `--emit-declarations`(SWC), `--no-type-check`, `--silent`, `nest build --parallel [concurrency]`, `nest-cli.json` 의 `includeLibraryAssets`.

**Breaking changes 요약**

| 변경 | 대응 |
|---|---|
| 패키지 **ESM** 배포 | 대개 없음. 커스텀 부트스트랩·번들러·테스트 러너 설정 검토 |
| **Node 20.19+ / 22.12+** | Node 업그레이드. **21.x 미지원** |
| **생명주기 훅이 컴포넌트 계층 레벨 단위로 호출** | init·teardown·테스트에서 **관련 프로바이더/모듈 간 순서 가정 재검토** |
| **NATS v3**, `nats` → `@nats-io/transport-node` | 패키지 교체 + 직접 import 수정. **패킷이 JSON 문자열로 직렬화**되고 커스텀 역직렬화기가 **전체 NATS 메시지**를 받으므로 **`msg.json()`** 으로 읽는다 |
| **GraphQL 구독**: `subscriptions-transport-ws` 지원 제거 | `graphql-ws` 로. **프로토콜이 wire 비호환이라 클라이언트도 바꿔야 한다.** `onConnect` 콜백 검토 |
| **GraphiQL 이 기본 IDE** | `playground` → `graphiql` |
| **`@nestjs/config` 가 Standard Schema 로 검증** | Joi 유지 시 v18+ 와 `validationOptions.libraryOptions` |
| **파이프 transform 시그니처 정제, `ArgumentMetadata` 가 제네릭으로** | 손으로 쓴 커스텀 파이프 시그니처 조정 |
| **`ConsoleLogger` 구조화 params 기본 on** | `structuredParams: false` |
| **Webpack CLI 워크플로 deprecated** | `--builder rspack` |
| **`angular` 스키매틱 제거** | 없음 |

**그 외**: `ValidationPipe` 에러 포맷 옵션, **`GrpcExceptionFilter`**(에러를 `UNKNOWN` 대신 제대로 된 gRPC 상태 코드로 매핑), Kafka 전송에서 `@MessagePattern()`·`@EventPattern()` 의 **RegExp 지원**, **요청 스코프 WebSocket 게이트웨이**(`REQUEST` 토큰으로 소켓 주입), `handleDisconnect` 의 **연결 종료 사유**, **마이크로서비스 pre-request 훅**, **Express 그레이스풀 셧다운**(in-flight 요청 드레인), HTTP 어댑터 에러 매핑 재작업.

## 인상 깊은 문장

> ***"Existing CommonJS applications keep working. 자신의 코드를 ESM 으로 옮기는 것은 전적으로 선택이다."***
> **이 릴리스 설계의 핵심**이고, 대규모 프레임워크 전환에서 드문 절제다(→ 전이 2).

> ***"It deliberately does not migrate your project to ESM, Vitest, or oxlint. Those are the defaults for newly generated projects; existing projects adopt them on their own schedule."***
> **의도적으로 안 한다**는 문장을 자동화 도구 설명에 넣었다(→ 전이 2, 3).

> ***"바꾼 것 전부와 아직 손으로 검토해야 할 것 전부를 리포트로 출력한다. `--dry-run` 을 먼저 돌려 파일을 건드리지 않고 그 리포트를 보라."***
> **좋은 마이그레이션 도구의 판별 기준**(→ 전이 3).

> ***"no manual span wiring and no collector to run"***
> **컬렉터가 없는 게 아니라 벤더 쪽에 있다**(→ 전이 1).

> ***"데코레이터 기반 class-validator 워크플로는 완전히 지원되며 제거 계획이 없다."***
> **2차 보도가 정반대로 쓴 대목**(→ 댓글 절).

## 댓글

**GitHub 릴리스에는 댓글 스레드가 없다.** 리액션 **총 114**: 👍32 · 🎉31 · 🚀22 · ❤️19 · 😄6 · 👀4 · **👎0**.
**hada 토픽과 HN 스레드를 찾지 못했다.** 검색으로 잡힌 건 InfoQ·Trilon(Nest 팀이 만든 컨설팅사)·개인 블로그의 **사전 로드맵 보도**뿐이다.

**읽을 때 감안**
- ①**릴리스한 쪽이 쓴 노트다.** 특히 ***"Most of these are handled automatically by `nest upgrade`"*** 는 **아직 검증되지 않은 주장**이다. 게시 하루째라 **실전 업그레이드 후기가 없다.** 이 문장의 신뢰도는 2~4주 뒤 이슈 트래커로 판정된다.
- ②**2차 보도가 과장한다.** 사전 보도 중 하나가 제목에 ***"the End of class-validator"*** 를 썼는데, **릴리스 본문은 정반대**로 ***"제거 계획이 없다"***고 쓴다. **로드맵 보도로 결론을 잡으면 안 된다.**
- ③**성능 수치가 하나도 없다.** Rspack 이 모노레포 **기본 번들러**가 됐는데 **webpack 대비 빌드 시간 비교가 없다.** oxlint·Vitest 도 마찬가지. **기본값을 바꾸면서 근거를 안 낸다.**
- ④**`@nestjs/observe` 의 상업적 성격이 릴리스 노트에 없다.** 요금제·셀프호스팅 여부·OTel 관계가 **전부 문서 쪽에만** 있다(→ 전이 1). 릴리스 노트만 읽으면 **무료 오픈소스 SDK 로 읽힌다.**
- ⑤**Trilon 과 Mau 는 Nest 팀 관련 사업체**다. `nest deploy` 가 Mau 로 배포한다는 건 **CLI 에 자사 서비스 경로가 들어왔다**는 뜻이고, 이건 중립적 사실이지만 **릴리스 노트가 그 관계를 밝히지 않는다.**
- ⑥**리액션 114 를 채택 신호로 읽으면 안 된다.** 릴리스 페이지를 본 사람 중 일부의 즉각 반응이고, **업그레이드해본 사람의 평가가 아니다.**
- ⑦**Breaking changes 표가 잘 정리돼 있지만 위험도 순이 아니다.** 표의 순서와 실제 사고 확률은 다르다(→ 전이 6).

## 내 생각 · 적용점

### 핵심 전이 1: "네이티브 관측성"의 실체는 프레임워크에 1급 훅이 생기고 거기에 자사 SaaS 가 꽂힌 것이다

**릴리스 노트는 이렇게 판다.** ***"generic APM 에이전트처럼 HTTP 서버를 패치하는 대신"*** Nest 자체 라이프사이클에 꽂히고, ***"수동 span 배선도 없고 돌릴 collector 도 없다."***

**둘 다 사실이다. 그런데 문서를 열면 성격이 달라진다.**

| 항목 | 확인된 내용 |
|---|---|
| 전송 대상 | **observe.nestjs.com 대시보드로 스트리밍.** API 키 방식 |
| 셀프호스팅 | **언급 없음** |
| 요금 | **Free 월 30만 이벤트·3일 보관** / **Pro 2,500만·30일** / **Scale 2억·90일** / Enterprise 협상. **초과분은 100만 이벤트당 추가 과금** |
| OpenTelemetry | **언급 없음** |

**즉 ***"돌릴 collector 가 없다"*** 는 collector 가 사라진 게 아니라 벤더 쪽에 있다는 뜻이다.** 그리고 **관측 데이터는 락인 자산 중에서도 옮기기 어려운 축**이다. 대시보드·알림·런북이 그 위에 쌓이기 때문이다.

**가장 걸리는 건 요금제가 아니라 OTel 언급이 없다는 것이다.** OTel exporter 로 내보낼 수 있으면 **나중에 옮길 수 있고**, 없으면 **SDK 를 걷어내야 옮긴다.** 어제 계열로 정리한 [[2026-07-03-clickhouse-winning-observability-wars]]의 축이 정확히 여기다. **관측성 시장의 경쟁은 수집이 아니라 표준 준수 여부에서 갈린다.**

**그렇다고 이게 나쁘다는 게 아니다.** OSS 프레임워크가 유지비를 어떻게 버느냐는 실재하는 문제이고([[2026-05-20-wasp-five-years-five-million-dollars-lesson]]), **옵트인이고 기존 앱에 강제되지 않는다.** 다만 **판별 기준은 분명히 해둘 만하다.**

***`instrument` 훅이 공개 인터페이스인가, 자사 SDK 전용 자리인가.***

**공개면 훌륭한 확장점이다.** Datadog·Sentry·OTel SDK 가 같은 훅에 꽂힐 수 있으면 프레임워크가 **경쟁을 만든 것**이고, 자사 전용이면 **게이트를 만든 것**이다. 릴리스 노트로는 구분이 안 된다.

**그리고 이 구분이 이번 시즌 반복된 축과 같다.** [[2026-08-20-apple-eu-app-policy-changes]]에서 정리한 규칙이 그대로 적용된다. ***플랫폼 변경을 읽을 때 요율보다 "누가 승인·표시를 통제하는가"를 먼저 본다.*** 여기서는 **누가 그 훅에 꽂힐 수 있는가**다. [[2026-08-20-openrouter-joining-stripe]]의 중립성 판별 신호와도 같은 형태다.

**우리 규칙: 관측 도구를 고를 때 OTel 호환성을 필수 조건으로 둔다.** 벤더 SDK 가 OTel exporter 를 지원하지 않으면 **좋아도 안 쓴다.** 관측성은 갈아탈 일이 반드시 생기는 층이다.

### 핵심 전이 2: ESM 전환을 선택 사항으로 만든 게 이 릴리스에서 설계로 가장 잘한 것이다

**모든 코어 패키지를 ESM 으로 옮기면서 앱은 CJS 로 남아도 되게 했다.** 그게 `require(esm)` 하나에 걸려 있고, **Node 20.19+/22.12+ 요구가 그 대가**다.

**그리고 자동화 도구가 스스로 선을 긋는다.** ***"It deliberately does not migrate your project to ESM, Vitest, or oxlint."***

**이게 마이그레이션 전략 3종 중 Compatibility Layer 의 교과서 사례다.** 새 인터페이스를 도입하되 기존 것이 계속 살아있고, **전환 일정을 사용자가 정한다.**

**8일 전 [[2026-08-20-daangn-auth-evolution]]에서 정리한 것과 형태가 같다.**

| | 당근 본인인증 | NestJS 12 ESM |
|---|---|---|
| 신규 | **강제**(신규 가입자) | **기본값**(`nest new` 가 ESM·Vitest·oxlint) |
| 기존 | **유인**(사주 서비스에 배치) | **방치**(`nest upgrade` 가 의도적으로 안 건드림) |
| 이유 | ***"상당수는 인증 대신 앱을 닫아 버릴 테니까"*** | ***"기존 프로젝트는 자기 일정으로 채택한다"*** |

**둘 다 "다 같이 바꾸는 날"을 만들지 않았다.** 그리고 그게 대규모 사용자 기반을 가진 쪽의 유일하게 현실적인 선택이다.

**반례를 생각해보면 이 절제의 크기가 보인다.** Angular 의 여러 메이저 전환이나 Python 2→3 이 남긴 상처는 **전환 자체가 아니라 강제성**에서 왔다. **여기는 패키지가 ESM 이 됐다는 사실을 앱이 몰라도 되게 만들었다.**

**우리 적용: 라이브러리·공통 모듈의 메이저 업그레이드에서 "소비자가 몰라도 되는가"를 성공 기준으로 둔다.** 소비자가 반드시 알아야 하면 그건 **호환 레이어를 안 만든 것**이다.

### 핵심 전이 3: `nest upgrade --dry-run` 이 dry-run 게이트의 정석 구현이다

***"바꾼 것 전부와 아직 손으로 검토해야 할 것 전부를 리포트로 출력한다. `--dry-run` 을 먼저 돌려 파일을 건드리지 않고 그 리포트를 보라."***

**두 부분이 다 중요한데 흔히 앞만 있다.**
- **바꾼 것**을 출력하는 도구는 흔하다.
- ***"아직 손으로 검토해야 할 것"***까지 출력하는 도구는 드물다. **자동화가 자기 한계를 명시하는 것**이기 때문이다.

**이건 mangolove 방법론의 dry-run 게이트가 요구하는 형태 그대로다.** 되돌리기 어려운 작업 전에 **변경될 파일 목록과 diff 미리보기**를 만들고 승인받는다. 그리고 8일 전 [[2026-08-20-aws-scte35-ai-ad-insertion]]에서 정리한 **증거 보관**과 같은 계열이다. **실행 전에 무엇이 일어날지, 실행 후에 무엇이 일어났는지를 남긴다.**

**판별 기준으로 쓸 만하다: 마이그레이션 도구를 평가할 때 `--dry-run` 이 있는지, 그리고 그 출력에 "자동화가 못 한 것" 절이 있는지 본다.** 후자가 없으면 **도구가 다 했다고 믿게 되고**, 그게 마이그레이션 사고의 흔한 경로다.

### 핵심 전이 4: 라이브러리를 고르지 않고 인터페이스를 골랐다

**Zod·Valibot·ArkType 중 하나를 채택했으면 진영 싸움이 됐을 것이다.** 대신 **Standard Schema 라는 인터페이스**를 채택했다. 그리고 `@nestjs/config` 도 **Joi 전용에서 인터페이스 기반으로** 옮겼다. Joi 는 **v18 에서 Standard Schema 를 구현**해서 계속 쓸 수 있다.

**여기에 두 번째 절제가 붙는다.** ***"class-validator 워크플로는 완전히 지원되며 제거 계획이 없다."*** 새 길을 내면서 **옛 길을 안 닫는다.**

**[[2026-08-20-daangn-auth-evolution]]에서 정리한 "표준을 먼저 깔아둔 게 몇 년 뒤 배당을 냈다"와 같은 축인데 시점이 반대다.** 거기는 **과거에 깔아둔 표준이 MCP 를 흡수**한 이야기였고, 여기는 **지금 표준을 까는** 이야기다. **그래서 배당은 아직 안 나왔다.** Standard Schema 생태계가 커지면 이 결정이 옳았던 게 되고, 안 크면 **추상화 하나를 더 얹은 것**으로 남는다.

**그리고 [[2026-08-18-jep-540-simple-json-api]]의 문장과 대구가 된다.** 거기는 ***"선택지를 늘리는 대신 보증을 늘린다"***였고, 여기는 **선택지를 늘리되 그 선택이 꽂히는 자리를 하나로 고정**했다. **다른 해법인데 같은 문제를 푼다: 사용자가 고르게 하되 프레임워크가 N 개를 알 필요는 없게.**

**단서 하나: 데코레이터가 메타데이터만 붙이고 파이프를 따로 등록해야 검증이 돈다.** 이건 **조용한 실패 모드**다. `@Body({ schema })` 를 써놓고 `StandardSchemaValidationPipe` 를 등록 안 하면 **아무 에러 없이 검증이 안 된다.** 도입한다면 **파이프 등록을 확인하는 테스트를 같이** 둔다.

### 핵심 전이 5: 조용한 실패를 시끄럽게 만드는 옵션이 기본값이 아니면 아무도 안 켠다

**라우트 충돌 진단이 이 릴리스에서 실무 체감이 가장 큰 기능일 수 있는데 옵트인이다.**

`@Get(':id')` 가 뒤에 선언된 `@Get('me')` 를 조용히 가리는 건 **Express 계열에서 오래된 사일런트 버그**이고, 증상이 **404 도 아니고 500 도 아니라 "잘못된 핸들러가 정상 응답"** 이라 찾기가 특히 나쁘다.

**이제 `routeConflictPolicy` 와 `routeResolutionStrategy` 가 생겼는데 ***"둘 다 기본값은 이전 동작"*** 이다.**

**하위 호환을 지킨 건 옳다.** 기본값을 바꿨다면 **기존 앱이 시작 시점에 에러로 죽었을 것**이다. 다만 결과는 예측 가능하다. **이 옵션을 켜는 사람은 이미 이 문제를 아는 사람**이고, **모르는 사람은 계속 모른다.**

**같은 구조가 `structuredParams` 에서는 반대로 갔다는 게 흥미롭다.** 로깅 params 는 **기본 on** 으로 켜고 breaking change 표에 넣었다. 즉 **릴리스가 어떤 건 기본값을 바꾸고 어떤 건 안 바꿨는데, 판단 기준이 노트에 없다.**

**내 짐작으로는 실패 양상의 차이다.** 로깅 포맷이 바뀌면 **눈에 보이고 되돌리면 된다.** 라우트 정책을 켜면 **앱이 부팅을 못 할 수 있다.** 그렇다면 기준은 **"틀렸을 때 되돌리기 쉬운가"**이고, 그건 [[2026-08-20-code-outruns-review]]의 ***"틀렸을 때의 비용으로 강도를 결정"***과 같은 원리다.

**우리 규칙: 새 프로젝트 템플릿에는 진단 옵션을 전부 켜둔다.** 기존 프로젝트는 **한 번 켜서 경고만 보고 끄는 것**만으로도 값이 있다.

### 핵심 전이 6: Breaking changes 표에서 가장 조용한 항목이 가장 위험하다

**표를 위험 순으로 다시 세우면 순서가 바뀐다.**

| 항목 | `nest upgrade` 가 고쳐주나 | 깨질 때 신호 |
|---|---|---|
| ESM 배포 | 대개 불필요 | **부팅 실패**(시끄러움) |
| Node 버전 | 도구가 거부 | **실행 거부**(시끄러움) |
| NATS v3 | **부분**(패키지 교체까지) | **런타임 역직렬화 오류**(중간) |
| GraphQL 구독 | **아니오**(클라이언트는 못 고침) | **클라이언트 연결 실패**(중간) |
| **생명주기 훅 호출 순서** | **아니오** | **없음**(조용함) |
| 파이프 시그니처 | 아니오 | **컴파일 에러**(시끄러움) |

**생명주기 훅이 유일하게 조용하다.** ***"Lifecycle hooks are now invoked by component hierarchy level."*** 이건 **코드가 아니라 가정이 깨지는 변경**이라 컴파일도 통과하고 테스트도 통과할 수 있다. 그리고 릴리스가 요구하는 대응이 ***"init·teardown·테스트에서 순서 가정 재검토"*** 인데, **재검토할 대상을 찾는 방법은 안 준다.**

**초기화 순서에 의존하는 코드는 대개 명시적으로 그렇게 쓰여 있지 않다.** 프로바이더 A 의 `onModuleInit` 에서 캐시를 채우고 B 가 그걸 쓰는 식인데, **의존성 그래프에는 그 관계가 없다.**

**그리고 NATS 항목이 두 번째로 위험하다.** 패키지 교체는 도구가 해주는데, ***"패킷이 JSON 문자열로 직렬화되고 커스텀 역직렬화기가 전체 NATS 메시지를 받으므로 `msg.json()` 으로 읽는다"*** 는 **손으로 고쳐야 하고 프로덕션 메시지에서만 드러난다.**

**GraphQL 구독은 성격이 또 다르다.** ***"프로토콜이 wire 비호환"*** 이라 **서버만 고쳐서는 안 되고 클라이언트를 같이 배포해야 한다.** 즉 **이건 코드 변경이 아니라 릴리스 조율 문제**다.

**업그레이드 계획에 쓸 순서: ①`--dry-run` 리포트 확보 → ②도구가 못 한다고 명시한 것 목록화 → ③그중 "조용히 깨지는 것"(생명주기 훅, NATS 역직렬화)을 먼저 → ④클라이언트 동시 배포가 필요한 것(GraphQL 구독)을 릴리스 일정에 반영 → ⑤나머지.**

### 핵심 전이 7: `errorCode` 는 작아 보이는데 API 하위 호환의 시작점이다

***"클라이언트가 메시지 문자열을 파싱하는 대신 안정적인 식별자로 분기."***

**안정 식별자를 안 주면 클라이언트는 반드시 메시지를 파싱한다.** 다른 방법이 없기 때문이다. 그리고 그 순간부터 **에러 메시지가 공개 API 계약**이 된다. 오타를 고치는 것도 breaking change 가 된다.

**이건 특히 B2B 에서 크다.** 파트너가 우리 에러 메시지에 의존하기 시작하면, **우리는 문구 하나 못 바꾸면서 그 사실을 모른다.** 그리고 알게 되는 시점은 **문구를 바꾸고 파트너가 장애를 겪은 뒤**다.

**같은 계열로 `GrpcExceptionFilter` 도 값이 크다.** 에러를 **`UNKNOWN` 대신 제대로 된 gRPC 상태 코드로** 매핑한다. `UNKNOWN` 은 **호출자가 재시도해야 할지 말지 판단할 수 없는 상태**라 사실상 정보가 없다.

**둘을 묶으면 원칙 하나가 나온다: 에러는 사람이 읽는 문장과 기계가 읽는 코드를 분리해서 낸다.** 문장은 바뀔 수 있고 코드는 계약이다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 제한적이다.** 온다 백엔드는 Java·Kotlin·Spring 중심이라 이 릴리스가 곧바로 걸리는 건 **Node 기반 BFF·사내 도구·프로토타입**이 있을 때다. 그 경우 **Node 20.19+/22.12+** 가 첫 관문이다.
- **전이되는 것은 관측 도구 선택 기준이다.** 우리가 어떤 APM·관측 SDK 를 붙이든 **OTel 호환성을 필수 조건**으로 둔다. 지금 편한 게 아니라 **나중에 옮길 수 있는가**로 고른다. [[2026-07-03-clickhouse-winning-observability-wars]]·[[2026-06-08-kakaopay-clickstack-log-platform]] 축.
- **파트너 API 에 안정 에러 코드를 준다.** 지금 우리 에러가 메시지 문자열로만 구분된다면 **파트너는 이미 그 문자열을 파싱하고 있다.** `errorCode` 같은 식별자를 추가하고, **문서에 "메시지는 변경될 수 있고 코드는 계약"** 이라고 명시한다.
- **공통 모듈 메이저 업그레이드의 성공 기준을 "소비자가 몰라도 되는가"로 둔다.** NestJS 가 ESM 전환에서 한 게 그거다. 소비자 팀이 반드시 알아야 하면 호환 레이어를 안 만든 것이다.
- **마이그레이션 도구·스크립트에 `--dry-run` 과 "자동화가 못 한 것" 절을 같이 넣는다.** 특히 **정산·요금 데이터 마이그레이션**. 바꾼 것만 출력하면 안 바꾼 것을 아무도 안 본다.
- **업그레이드 계획을 "조용히 깨지는 것" 우선으로 세운다.** 컴파일 에러로 잡히는 건 저절로 잡히고, **초기화 순서·직렬화 포맷·프로토콜 호환처럼 런타임에만 드러나는 것**이 실제 위험이다. 이건 프레임워크 업그레이드만이 아니라 **우리 DB 스키마·메시지 스키마 변경에도 같다.**
- **클라이언트 동시 배포가 필요한 변경을 따로 분류한다.** GraphQL 구독 프로토콜 교체처럼, **파트너 연동 규격 변경은 코드가 아니라 릴리스 조율 문제**다. 우리 채널 연동 스펙 변경이 정확히 그 종류다.
- **진단 옵션은 새 프로젝트 템플릿에서 전부 켠다.** 기존 서비스는 **한 번 켜서 경고만 수집**해도 값이 있다.

## 연관 자료
- [[2026-08-20-daangn-auth-evolution]]: *신규는 새 기본값, 기존은 자기 일정. 같은 마이그레이션 형태*
- [[2026-08-18-jep-540-simple-json-api]]: *표준 라이브러리가 선택지와 보증 사이에서 고르는 문제의 자바 판본*
- [[2026-07-03-clickhouse-winning-observability-wars]] · [[2026-06-08-kakaopay-clickstack-log-platform]]: *관측성 층의 락인과 표준 준수*
- [[2026-08-20-apple-eu-app-policy-changes]] · [[2026-08-20-openrouter-joining-stripe]]: *훅·경로를 쥔 쪽이 무엇을 통제하는가. 중립성 판별 신호*
- [[2026-08-20-aws-scte35-ai-ad-insertion]]: *실행 전 dry-run 과 실행 후 증거의 같은 계열*
- [[2026-08-20-code-outruns-review]]: *"틀렸을 때의 비용으로 강도를 결정"이 기본값 선택에도 적용된다*
- [[2026-06-08-prefer-duplication-over-wrong-abstraction]]: *Standard Schema 가 옳은 추상화인지는 생태계가 커져야 판정된다*
- [[2026-05-20-wasp-five-years-five-million-dollars-lesson]]: *OSS 프레임워크의 수익 모델 문제*
- [[2026-08-01-bun-zig-to-rust-rewrite-with-ai]] · [[2026-07-09-typescript-7-0-announcement]]: *JS/TS 툴체인이 통째로 갈아엎히는 시즌*

## 한 달 뒤 회고
*(2026-09-28 즈음: ①`nest upgrade` 가 실제로 "대부분 자동 처리"했는지 이슈 트래커로 확인 ②생명주기 훅 순서 변경으로 인한 사고 보고가 올라왔는지 ③`instrument` 훅에 Nest 팀 외 SDK(OTel·Sentry·Datadog)가 꽂혔는지, 즉 공개 확장점인지 자사 자리인지 ④`@nestjs/observe` 가 OTel exporter 를 지원하게 됐는지 ⑤Rspack·oxlint 전환의 실측 성능 비교가 나왔는지 ⑥우리 파트너 API 에 안정 에러 코드를 추가했는지 ⑦우리 마이그레이션 스크립트에 dry-run 과 "자동화가 못 한 것" 절을 넣었는지)*
