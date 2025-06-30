
# Ubuntu FIO Docker Image

이 저장소는 [fio](https://github.com/axboe/fio) 디스크/스토리지 벤치마크 도구가 설치된 **Ubuntu 기반** Docker 이미지를 손쉽게 빌드할 수 있도록 합니다.

## 📁 파일 구성

- `Dockerfile`  
  - Ubuntu 22.04 베이스, `fio`를 설치함.
- `build-fio.sh`  
  - 다양한 태그/레포지토리/이미지명을 환경 변수로 지정하여 Docker 이미지를 빌드하는 스크립트.

## 🚀 빌드 방법

1. **Dockerfile과 build-fio.sh가 같은 디렉토리에 있어야 합니다.**
2. 실행 권한을 부여합니다:
    ```bash
    chmod +x build-fio.sh
    ```
3. 기본 이미지 이름(`cr.makina.rocks/external-hub/ubuntu-fio:latest`)으로 빌드:
    ```bash
    ./build-fio.sh
    ```

## ⚙️ 커스텀 이미지 네이밍

환경 변수로 이미지의 repository, name, tag를 지정할 수 있습니다.

| 환경변수         | 기본값                           | 예시 사용법                                            |
|------------------|----------------------------------|--------------------------------------------------------|
| IMAGE_REPO       | cr.makina.rocks/external-hub     | `IMAGE_REPO=myrepo/hub`                                |
| IMAGE_NAME       | ubuntu-fio                       | `IMAGE_NAME=fio-bench`                                 |
| IMAGE_TAG        | latest                           | `IMAGE_TAG=0.2`                                        |

예시:
```bash
IMAGE_REPO=myrepo/hub IMAGE_NAME=fio-bench IMAGE_TAG=0.2 ./build-fio.sh
# 결과: myrepo/hub/fio-bench:0.2
```

## 🐳 빌드된 이미지 예시

빌드 결과 이미지는 아래와 같이 사용합니다:
```bash
docker run --rm cr.makina.rocks/external-hub/ubuntu-fio:latest fio --help
```

Kubernetes Job에 사용할 땐 다음처럼 활용할 수 있습니다:
```yaml
containers:
- name: fio
  image: cr.makina.rocks/external-hub/ubuntu-fio:latest
  command: [ "fio", "--name=writefile", ... ]
```

## 💡 참고 사항

- Ubuntu 기본값은 22.04입니다. 변경하려면 Dockerfile의 FROM을 수정하세요.
- 필요시 `apt-get install`에 추가 패키지를 더할 수 있습니다.
- 이미지 빌드 후 Push가 필요하다면:
    ```bash
    docker push <이미지명:태그>
    ```

---

## 📝 문의 및 개선

추가 옵션, Build-Arg, Push 자동화 등 개선 요청은 언제든 환영합니다!

