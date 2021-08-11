# JSTL e Expression Language

### Conhecendo Expression Language

Além do formato do JSP visto na última aula, há uma outra opção para utilizar variáveis dinâmicas nos HTML. As `Expression Language` permitem essa dinâmica de uma forma mais fácil, apenas colocando `${ }` e dentro o nome do atributo que vc gostaria de acessar da requisição, poupando muitas linhas do nosso código.

```jsp
<html>
	<body>
	Empresa ${ empresa } foi cadastrada com sucesso no DB!
	</body>
</html>
```