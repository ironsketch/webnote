<html>
	<head>
<title>Logic Programming</title>
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<div id="container">
			<div id="top">
                <img style="float:right;padding-right:20px;width:300px;" src="cat.gif" />
                <div id="title">
					<h1>Logic Programming</h1>
                </div>
			</div>
			<div id="heading">
In this thread we will study logic programming: how programs can be expressed declaratively using first order predicate logic, how to use relations instead of functions in programming, how constraints can be used to find solutions, the underlying computational model of resolution theorem programing, and the use of unification to find solutions.            
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

