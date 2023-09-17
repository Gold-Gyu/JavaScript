# 베이스 이미지 :버전, 생략 시 LTS 설치
FROM nginx

# 작업 디렉토리 지정 : work dir 고정
WORKDIR /app

# 이미지 빌드 : work dir 에 build 폴더 생성 /app/build
RUN mkdir ./build

# 복사 : host pc의 현재경로의 build 폴더를 workdir 의 build 폴더로 복사
ADD ./build ./build

# 이미지 빌드 : nginx 의 default.conf 를 삭제
RUN rm /etc/nginx/conf.d/default.conf

# 복사 : host pc 의 nginx.conf 를 아래 경로에 복사
COPY ./nginx.conf /etc/nginx/conf.d

# 포트 할당
EXPOSE 3000

# 컨테이너 생성 및 실행 : container 실행 시 자동으로 실행할 command
CMD ["nginx", "-g", "daemon off;"]