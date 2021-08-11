# Páginas Dinâmicas com JSP

### Primeiro JSP

Vimos nas aulas anteiores o processo de retornar um dado no formato HTML através do Servlet. Imagine agora enviar vários formatações de HTML por esse recurso, você acha que é uma opção viável?

Para facilitar esse processo, nós temos o JSP (`Java Server Page`). O JSP é um arquivo que aceita HTML e também nos permite executar código java, facilitando nosso processo.

Vamos criar então nosso primeiro JSP:
- Junto com as pastas de `WEB-INF` e `META-INF`, crie um novo arquivo com a extensão .jsp, esse será o nosso arquivo JSP que permitirá fazer páginas mais dinâmicas.
- Ele mantém a mesma estrutura do HTML, para inserir um código Java, será necessário colocar dentro das tags `<% %>`.

```jsp
<% 
	String nomeEmpresa = "Alura";
	System.out.println(nomeEmpresa);
%>

<html>
	<body>
		Empresa <% out.println(nomeEmpresa); %> foi cadastrada!
	</body>
</html>
```

- O JSP possui a variável out por default que permite executar ações de print como no exemplo.
- Uma outra opção para facilitar a exibição de variáveis é colocar um `=` após a tag de código Java

```jsp
    <% 
	String nomeEmpresa = "Alura";
	System.out.println(nomeEmpresa);
%>

<html>
	<body>
		Empresa <%= nomeEmpresa %> foi cadastrada!
	</body>
</html>
```