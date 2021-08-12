# Deploy da aplicação

### Conhecendo o web.xml

Na pasta `WEB-INF`, que armazena o arquivo web.xml. No começo do projeto criamos esse arquivo de forma manual, afinal ele não é mais gerado automaticamente, pois trata-se de um recurso opcional. Esse arquivo, apesar de pouco usado hoje em dia, em algum momento poderá aparecer em alguma documentação, em tutoriais ou em algum projeto legado que ainda faz uso desse arquivo, logo, é importante ter uma noção do que se trata.
Esse é o arquivo que armazena configurações relacionadas ao mundo de Servlets. Ao abrirmos o arquivo `web.xml`, teremos acesso às configurações geradas automaticamente.
- A possibilidade de definir um arquivo que é automaticamente carregado quando executamos a aplicação.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
  <display-name>gerenciador</display-name>
  <welcome-file-list>
    <welcome-file>bem-vindo.html</welcome-file>
  </welcome-file-list>
</web-app>
```

- Podemos usar o XML para configurar o mapeamento do Servlet.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
  <display-name>gerenciador</display-name>
  <welcome-file-list>
    <welcome-file>bem-vindo.html</welcome-file>
  </welcome-file-list>

  <servlet>
     <servlet-name>OiMundoServlet</servlet-name>
     <servlet-class>br.com.curso.servlet.OiMundoServlet</servlet-class>
  </servlet>


  <servlet-mapping>
     <servlet-name>OiMundoServlet</servlet-name>
     <url-pattern>/ola</url-pattern>
  </servlet-mapping>
</web-app>
```