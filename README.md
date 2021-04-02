# delta-processor-null &middot; [![GitHub license](https://img.shields.io/github/license/kaist-gclab/delta-processor-null)](https://github.com/kaist-gclab/delta-processor-null/blob/main/LICENSE) [![CircleCI main](https://img.shields.io/circleci/build/gh/kaist-gclab/delta-processor-null/main?label=main)](https://circleci.com/gh/kaist-gclab/delta-processor-null/tree/main) [![CircleCI develop](https://img.shields.io/circleci/build/gh/kaist-gclab/delta-processor-null/develop?label=develop)](https://circleci.com/gh/kaist-gclab/delta-processor-null/tree/develop)

SW스타랩 <3차원 기하 모델 프로세싱 프레임워크 개발> 무효 처리기 계산 노드

## 설명
입력으로 주어진 에셋에 변화를 가하지 않고 그대로 출력하는 계산 노드를 구현합니다. 특별한 변화가 있기 전까지는, 이것을 다른 계산 노드 구현의 참조로 사용할 수 있습니다.


## 실행 방법

**이미지 빌드**:
```bash
$ docker build -t kaistgclab/delta-processor-null .
```

**컨테이너 실행**:
```bash
$ docker run --rm \
    -v /path/to/local/dir:/data \
    kaistgclab/delta-processor-null \
    -i INPUT_FILE_NAME \
    -o OUTPUT_FILE_NAME
```
- `--rm` 옵션은 컨테이너가 실행된 이후 자동으로 컨테이너를 삭제하는 옵션입니다.
    - 지정해주지 않아도 실행에 문제가 없으나, 불필요한 컨테이너가 쌓이는 것을 방지하기 위해 권장하는 옵션입니다.
- `-v`는 volume을 매핑해주는 옵션으로, input 파일과 output 파일을 교환하기 위해 사용됩니다.
    - Volume으로 지정하는 폴더 안에 input 파일이 포함되도록 설정해 주세요.
    - 또한 Volume 설정을 하실 때, 상대경로가 아닌 절대경로로 지정해주어야 한다는 것에 유의해 주세요.
- `kaistgclab/delta-processor-null`는 앞선 스크립트에서 지정해 주었던 이미지의 태그 이름입니다.
- `INPUT_FILE_NAME`에는 입력파일의 이름을 기술합니다.
- `OUTPUT_FILE_NAME`에는 출력파일의 이름을 기술합니다. (생략 가능)


## 실행 방법 (로컬)

개발 환경에서는 Docker를 이용하지 않고 아래 순서를 통해 모듈을 실행할 수 있습니다.

```bash
# 모듈 실행을 위해 필요한 라이브러리를 설치합니다.
$ npm install

# 모듈을 빌드합니다.
$ npm run build

# 모듈을 실행합니다. 입력 파일 이름과 출력 파일 이름을 지정해줍니다.
$ node index.js --input teapot.obj --output output.obj

# 위 명령어는 아래로 단축될 수 있습니다.
$ node index.js -i teapot.obj -o output.obj
```
