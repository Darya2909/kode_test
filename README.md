# kode_test
 Перед началом работы запустить команды:

docker cp .\note.db.sql my_project_postgres:/backup.sql

docker exec -it my_project_postgres bash -c "pg_restore -U postgres -d note_db /backup.sql"

curl запросы:

curl -X POST "http://localhost:8000/" -H "Content-Type: application/json" -u "user1:12345678" -d "{\"name\": \"New note\", \"text\": \"Test task\"}"

curl -X GET "http://localhost:8000/" ^-u "user1:12345678"

