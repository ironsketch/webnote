<!DOCTYPE html><head><title>Lambda Calculus Church Rosser Property</title><link rel="stylesheet" href="../styles.css"><link rel="stylesheet" href="../katex.min.css"><script src="../katex.js"></script></head><body><div id="container"><div id="top"><img style="float:right;padding-right:20px;width:250px;" src="../cat3.gif" /><div id="title"><h1>Lambda Calculus Church Rosser Property</h1></div></div><div id="top_nav"><a class="top_nav" href="formal_language/">Formal</a><a class="top_nav" href="logic/">Logic</a><a class="top_nav" href="lambda/">Lambda</a><a class="top_nav" href="types/">Types</a></div><div id="cardHolder"><center><div id="textArea" style="padding-top:20px"></div><script>try{katex.render("\\textbf{Church Rosser Property}\\\\
\\quad\\hearts\\text{ A fundemental theorem of the }\\lambda\\text{ calculus}\\\\
\\text{}\\\\
\\textbf{The Diamond Property}\\\\
\\text{Let }M,N,P\\text{ be }\\lambda\\text{ terms such that }M\\rightarrow N\\text{ and }M\\rightarrow P\\text{ then there exists a }\\lambda\\text{ term }Z\\text{ such that }N\\rightarrow Z\\text{ and }P\\rightarrow Z\\\\
\\quad\\hearts\\text{ The CR property is a convergence property for fill }\\beta\\text{ evaluation }\\\\
\\quad\\hearts\\text{ If a }\\lambda \\text{ term reaches normal form, then every other evaluation path will also reach that same normal form.}\\\\
\\quad\\hearts\\text{ If a }\\lambda\\text{ term diverges on any evaluation order, then it will diverge on all evaluation orders.}\\\\
\\quad\\quad\\rightarrow(\\lambda x.x)(\\lambda x.y)(\\Omega)\\\\
\\quad\\quad\\rightarrow(\\lambda x.y)(\\Omega)\\\\
\\quad\\quad\\text{Oops }\\Omega\\text{ dissapears}\\\\
\\quad\\quad\\text{Or you can do }\\Omega\\text{ forever and then go back to getting rid of }\\Omega\\\\
\\text{}\\\\
\\textbf{Proof of Church Rosser}\\\\
\\quad\\hearts\\text{ 1) }\\frac{}{x\\triangleright x}\\\\
\\quad\\hearts\\text{ 2) }\\frac{P\\triangleright P^\\prime N\\triangleright N^\\prime}{PN\\triangleright P^\\prime N^\\prime}\\\\
\\quad\\hearts\\text{ 3) }\\frac{N\\triangleright N^\\prime}{\\lambda x.N\\triangleright \\lambda x.N^\\prime}\\\\
\\quad\\hearts\\text{ 4) }\\frac{Q\\triangleright Q^\\prime N\\triangleright N^\\prime}{(\\lambda x.Q)N\\triangleright Q^\\prime[N^\\prime/x]}\\\\
\\quad\\hearts\\text{ 5) }\\frac{P\\triangleright P^\\prime\\text{, where }x\otin FV(P)}{\\lambda x.Px\\triangleright P^\\prime}\\\\
\\text{}\\\\
\\textbf{Midterm Review}\\\\
\\text{if }t\\rightarrow t_1\\text{ and }t\\rightarrow t_2\\text{ then }t_1=t_2",textArea);} catch(err){}</script></center></div><div id="bottom"><br> Thanks for checking out my mafff and pergrehming sight.<p class="copyright">Copyright &copy; 2017 and beyond</p></div></div></body></html>