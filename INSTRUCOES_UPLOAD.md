# 📤 Instruções para Upload via SSH

## Método 1: Usando SCP (Recomendado)

Se você tiver acesso SCP configurado:

```bash
scp frontend-completo-home.html u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/public/
```

## Método 2: Via SSH com cat (Mais Simples)

1. Conecte-se ao servidor via SSH:
```bash
ssh u127271520@betgeniusbr.com
```

2. Navegue até a pasta public:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
```

3. Crie o arquivo usando cat:
```bash
cat > frontend-completo-home.html << 'FILE_EOF'
```

4. **Cole todo o conteúdo do arquivo `frontend-completo-home.html` aqui**

5. Digite `FILE_EOF` e pressione Enter para finalizar

## Método 3: Usando base64 (Para arquivos grandes)

No seu computador local:
```bash
base64 frontend-completo-home.html > /tmp/frontend_base64.txt
```

No servidor via SSH:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
# Cole o conteúdo de /tmp/frontend_base64.txt aqui
base64 -d > frontend-completo-home.html
```

## Verificação

Após o upload, verifique se o arquivo foi criado:
```bash
ls -lh frontend-completo-home.html
```

## Acesso

Após o upload, acesse:
https://betgeniusbr.com/frontend-completo-home.html
