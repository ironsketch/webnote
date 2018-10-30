<html>
	<head>
<title>Types and Programming Languages</title>
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<div id="container">
			<div id="top">
                <img style="float:right;padding-right:20px;width:500px;" src="cat.gif" />
                <div id="title">
					<h1>Types and Programming Languages</h1>
                </div>
			</div>
			<div id="heading">
This course focuses on the the mathematical foundations for types in programming languages. The approach starts with the development of types for the Lambda Calculus. The fall quarter emphasizes the core type theory and the winter quarter leans toward type extensions and implementations.
            </div>
            <div id="top_nav">
                <a class="top_nav" href="../">Home</a><a class="top_nav" href="../formal_language/">Formal</a><a class="top_nav" href="../logic/">Logic</a><a class="top_nav" href="../lambda/">Lambda</a><a class="top_nav" href="../types/">Types</a>
            </div>
			<div id="cardHolder">
            <?php
                function get_title($url){
                    $str = file_get_contents($url);
                    if(strlen($str)>0){
                        $str = trim(preg_replace('/\s+/', ' ', $str));
                        preg_match("/\<title\>(.*)\<\/title\>/i",$str, $title);
                    return $title[1];
                    }
                }
                echo "<div id='one'>";
                $path = ".";
                    if ($handle = opendir($path)) {
                        while (false !== ($file = readdir($handle))) {
                            if ('.' === $file) continue;
                            if ('..' === $file) continue;
                            $html = explode(".", $file);
                            if($html[1] === "html" || $html[1] === "php"){
                                $title = get_title($file);
                                echo "<div id='cardFormal'><span class='cardtitle'>" . $title . "</span><p class='start'><a href='" . $file . "' class='startLink'>Open</a></p></div>";
                            }
                        }
                        closedir($handle);
                    }
                echo "<h3 class='homework'>Homework</h3>";
                 $path = "hw/";
                     if ($handle = opendir($path)) {
                         while (false !== ($file = readdir($handle))) {
                             if ('.' === $file) continue;
                             if ('..' === $file) continue;
                             $html = explode(".", $file);
                             if($html[1] === "pdf"){
                                 echo "<p class='start'><a class='startLink' href='" . $path . $file . "'>" . $file . "</a></p>";
                             }
                         }
                         closedir($handle);
                     }
                echo "</div>";
                ?>          
			</div>
			<div id="bottom">
				<br> Thanks for checking out my mafff and pergrehming sight.
				<p class="copyright">Copyright &copy; 2017 and beyond</p>
			</div>
		</div>
	</body>
</html>

