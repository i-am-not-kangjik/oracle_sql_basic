# oracle_sql_basic
## m2 mac에서 oracle 환경 설정 과정
1. colima 설치

``` bash
brew install colima
```

2. docker 설치
command가 어려우면 Docker desktop 설치

``` bash
brew install --cask docker
```

3. colima 실행

``` bash
colima start --memory 4 --arch x86_64
```

4. docker oracle 11g 컨테이너 받기

``` bash
docker run --restart unless-stopped --name oracle -e ORACLE_PASSWORD=pass -p 1521:1521 -d gvenzl/oracle-xe
```
이렇게 받으면 
id : system
pw : pass가 됨

5. log 확인
``` bash
docker logs -f oracle
```

6. oracle 실행

``` bash
docker exec -it oracle sqlplus
```

참고 : https://shanepark.tistory.com/400