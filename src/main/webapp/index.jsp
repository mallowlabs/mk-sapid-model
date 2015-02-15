<!doctype html>

<html>
<head>
  <meta charset="utf-8">
  <title>mk-sapid-model</title>

  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap.css" rel="stylesheet">
  <link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap-responsive.css" rel="stylesheet">

</head>

<body>
<div class="navbar">
  <div class="navbar-inner">
    <div class="container">
      <a href="/" class="brand">mk-sapid-model</a>
    </div>
  </div>
</div>

<div class="container">
<div class="row">
<div class="span8 offset2">

<div class="page-header">
  <h1>Welcome to Sapid as a Service</h1>
</div>

<p>
  This is a service that parses your codes with <a href="http://www.sapid.org">Sapid</a>.
  You can get AST (Abstract Syntax Tree) of your codes.
  This supports Java (7) and JavaScript (EcmaScript) now.
</p>

<div>
  <h2>Usage</h2>
  <h3>Java</h3>
  <pre>$curl -d code="import java.util.*;" https://mk-sapid-model.herokuapp.com/jx</pre>
  <p>You will get the AST as a XML.</p>
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;File offset="0"&gt;&lt;Import offset="0"&gt;&lt;kw offset="0"&gt;import&lt;/kw&gt;&lt;sp offset="6"&gt; &lt;/sp&gt;&lt;QName offset="7"&gt;&lt;QName offset="7"&gt;&lt;QName offset="7"&gt;&lt;ident offset="7"&gt;java&lt;/ident&gt;&lt;/QName&gt;&lt;op offset="11"&gt;.&lt;/op&gt;&lt;QName offset="12"&gt;&lt;ident offset="12"&gt;util&lt;/ident&gt;&lt;/QName&gt;&lt;/QName&gt;&lt;op offset="16"&gt;.&lt;/op&gt;&lt;QName offset="17"&gt;&lt;op offset="17"&gt;*&lt;/op&gt;&lt;/QName&gt;&lt;/QName&gt;&lt;op offset="18"&gt;;&lt;/op&gt;&lt;/Import&gt;&lt;/File&gt;
</pre>
  <h3>JavaScript</h3>
  <pre>$curl -d code="var i = 0;" https://mk-sapid-model.herokuapp.com/jsx</pre>
  <p>You will get the AST as a XML.</p>
<pre>
&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;!DOCTYPE File SYSTEM "JSX-model.dtd"&gt;
&lt;File id="0" modelName="JSX-model" modelMajorVersion="0" modelMinorVersion="8"&gt;&lt;VarDec id="2"&gt;&lt;kw pos="1 1"&gt;var&lt;/kw&gt;&lt;sp pos="1 4"&gt; &lt;/sp&gt;&lt;Expr id="3" sort="Assign"&gt;&lt;ident id="1" refid="1" nameId="1" pos="1 5"&gt;i&lt;/ident&gt;&lt;sp pos="1 6"&gt; &lt;/sp&gt;&lt;op pos="1 7"&gt;=&lt;/op&gt;&lt;sp pos="1 8"&gt; &lt;/sp&gt;&lt;Expr id="4" sort="Literal"&gt;&lt;literal sort="decimal" pos="1 9"&gt;0&lt;/literal&gt;&lt;/Expr&gt;&lt;/Expr&gt;&lt;op pos="1 10"&gt;;&lt;/op&gt;&lt;/VarDec&gt;&lt;/File&gt;
</pre>
</div>
<footer>
Copyright &copy; 2013 mallowlabs.
</footer>
</div>

</div>
<div>

</div>
</div>

</body>
</html>
