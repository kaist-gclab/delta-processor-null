# delta-processor-null &middot; [![GitHub license](https://img.shields.io/github/license/kaist-gclab/delta-processor-null)](https://github.com/kaist-gclab/delta-processor-null/blob/main/LICENSE) [![CircleCI main](https://img.shields.io/circleci/build/gh/kaist-gclab/delta-processor-null/main?label=main)](https://circleci.com/gh/kaist-gclab/delta-processor-null/tree/main) [![CircleCI develop](https://img.shields.io/circleci/build/gh/kaist-gclab/delta-processor-null/develop?label=develop)](https://circleci.com/gh/kaist-gclab/delta-processor-null/tree/develop)

SW스타랩 <3차원 기하 모델 프로세싱 프레임워크 개발> 무효 처리기 계산 노드

## 설명
입력으로 주어진 에셋에 변화를 가하지 않고 그대로 출력하는 계산 노드를 구현합니다. 특별한 변화가 있기 전까지는, 이것을 다른 계산 노드 구현의 참조로 사용할 수 있습니다.


## 실행 방법

```bash
# 모듈 실행을 위해 필요한 라이브러리를 설치합니다.
$ npm install

# 모듈을 빌드합니다.
$ npm run build

# 모듈을 실행합니다. 입력 파일 이름과 출력 파일 이름을 지정해줍니다.
$ node index.js --input teapot.obj --output output.obj

# 위 명령어는 아래로 단축될 수 있습니다.
$ node index.js - teapot.obj - output.obj
```
