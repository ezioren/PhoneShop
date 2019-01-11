#### 生成 requirements
pip freeze | grep -v "pkg-resources" > requirements.txt
