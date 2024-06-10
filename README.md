# DB
## db 및 테이블 생성 sql파일 설정 방법
db 세팅
`init_db.sql` 파일을 저장할 위치는 MariaDB 서버 설정에 따라 다를 수 있지만, 일반적으로 다음과 같은 경로에 저장하는 것이 좋습니다:

1. **MariaDB 데이터 디렉토리**: MariaDB의 데이터 디렉토리 또는 관련 디렉토리에 저장하는 것이 일반적입니다. 이 위치는 MariaDB 서버의 설정 파일 (`my.cnf` 또는 `my.ini`)에서 확인할 수 있습니다.
    - 예: `/var/lib/mysql/init_db.sql`

2. **MariaDB 설정 파일 (`my.cnf` 또는 `my.ini`)에 설정**:
    - 보통 MariaDB 설정 파일은 `/etc/mysql/my.cnf` 또는 `/etc/my.cnf` 경로에 있습니다. 이 파일에 `init-file` 설정을 추가하여 MariaDB가 시작할 때 스크립트를 실행하도록 할 수 있습니다.

### MariaDB 설정 파일 예시
아래는 `my.cnf` 파일에 `init-file`을 설정하는 예시입니다:

```ini
[mysqld]
# 기타 설정들
init-file=/var/lib/mysql/init_db.sql
```

### 단계별 가이드

1. **`init_db.sql` 파일 생성**:
    - 파일을 작성하고 저장합니다.
    - 예: `/var/lib/mysql/init_db.sql`

2. **MariaDB 설정 파일 수정**:
    - 설정 파일 (`/etc/mysql/my.cnf` 또는 `/etc/my.cnf`)을 열고, `[mysqld]` 섹션에 다음 줄을 추가합니다:
    ```ini
    [mysqld]
    init-file=/var/lib/mysql/init_db.sql
    ```

3. **파일 권한 설정**:
    - MariaDB 서버가 해당 파일을 읽을 수 있도록 적절한 권한을 설정합니다:
    ```sh
    sudo chown mysql:mysql /var/lib/mysql/init_db.sql
    sudo chmod 644 /var/lib/mysql/init_db.sql
    ```

4. **MariaDB 서버 재시작**:
    - 설정을 적용하려면 MariaDB 서버를 재시작합니다:
    ```sh
    sudo systemctl restart mariadb
    ```
    또는
    ```sh
    sudo service mysql restart
    ```

이제 MariaDB가 시작될 때마다 `init_db.sql` 파일을 실행하여 데이터베이스와 테이블을 자동으로 생성합니다.

### 참고 사항
- **init-file 실행 제한**: `init-file` 옵션은 MariaDB 서버가 시작될 때 단 한 번만 실행됩니다. 이 스크립트를 반복적으로 실행하려면 별도의 스크립트나 애플리케이션 로직을 작성해야 합니다.
- **에러 처리**: `init-file`이 실행되는 동안 오류가 발생하면 MariaDB 서버가 시작되지 않을 수 있으므로, 스크립트를 테스트 환경에서 충분히 검증한 후 사용하세요.

## 인코딩 방법
```
[mysqld]
...
init_connect="SET collation_connection=utf8_general_ci"
init_connect="SET NAMES utf8"
character-set-server=utf8
collation-server=utf8_general_ci
```
