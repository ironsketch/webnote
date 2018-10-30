<html>
	<head>
<title>Formal Languages</title>
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<div id="container">
			<div id="top">
                <img style="float:right;padding-right:20px;" src="cat.gif" />
                <div id="title">
					<h1>Formal Languages</h1>
                </div>
			</div>
			<div id="heading">
				<br>In this thread we will study Formal Langages: what kinds of languages do we study? how are they classified? what formal tools we have for understanding those languages? and what is the relationship of formal languages to computer science? This thread has connections to computability (what is computable and how do we know?), language processing (how can we recognize a language? Is a string in a language? Can we generate the strings in a language?) and practical applications (the basis for parsing). By the end of the class students should understand

<br />- how to classify languages
<br />- which abstract machines can be used to recognize classes of languages
<br />- the relationship of grammars to languages and how to use the formal properties of grammars and machines to prove properties about classes of languages.
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
                echo "<h3>Formal Languages</h3>";
                $path = "n/";
                    if ($handle = opendir($path)) {
                        while (false !== ($file = readdir($handle))) {
                            if ('.' === $file) continue;
                            if ('..' === $file) continue;
                            $html = explode(".", $path.$file);
                            if($html[1] === "html" || $html[1] === "php"){
                                $title = get_title($path.$file);
                                echo "<div id='cardFormal'><span class='cardtitle'>" . $title . "</span><p class='start'><a href='" . $path.$file . "' class='startLink'>Open</a></p></div>";
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

