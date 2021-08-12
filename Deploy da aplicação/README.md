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

### Inversão de controle

Retomando ao conteúdo principal do curso, **O que é um Servlet?**. Servlet é um obejto que pode ser acionado por meio de uma requisição do protocolo HTTP. Essa interação é possibilitada pelo Tomcat, e precisa seguir algumas regras, como estender, sobrescrever os métodos `doGet()`, `doPost()` e `service()`, e fazer o mapeamento para indicar a URL.

Repare que em nenhum local do projeto temos o método main(). E quem faz isso é o Tomcat, nosso servlet container. Isso ocorre porque é o Tomcat que receberá a requisição HTTP, e depois deve chamar o método necessário. O Tomcat realiza o papel intermediário entre o navegador e objeto, e por isso também é conhecido como `middleware`.

O Tomcat que criará nosso Servlet de acordo com as requisições, mas ele instancia apenas na primeira requisição, após isso ele reaproveita a que já está criada na memória. Por isso o Servlet é chamado de `Singleton`, um escopo, que sobrevive no projeto por tempo indeterminado enquanto o Tomcat estiver no ar, sem nunca recriá-lo. Isso poderia ser diferente, o Tomcat poderia recriar o servlet a cada requisição, existem outras bibliotecas que fazem isso, que mudam o escopo original do Servlet que antes era Singleton.

Esse processo do Tomcat criar automaticamente a instanciados Servlet é chamado de Inversão de Controle (IOT)