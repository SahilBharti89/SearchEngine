
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Welcome Page</title>
        <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.history.js"></script>

        <script type="text/javascript">

            $(document).ready(function () {


                $.history.init(pageload);
                //return #page1,#Page2 etc... // setting its class as selected
                $('a[href=' + window.location.hash + ']').addClass('selected');
                //if a <a> of rel=ajax type is clicked, then ->
                $('a[rel=ajax]').click(function () {

                    var hash = this.href;
                    //extracting the pagea from the href link clicked
                    //init: http://localhost:8080/WebApplication1/aboutPageAJ.html#page2
                    //after replace: page2
                    hash = hash.replace(/^.*#/, '');
                    $.history.load(hash);


                    $('a[rel=ajax]').removeClass('selected');
                    // removing the selected class fromt the clicked link - 
                    // selected is a 'style' for <li>

                    $(this).addClass('selected');
                    //applying it to the currenly clicked element

                    $('#body').hide();
                    //hiding the body to reload content (done in getPage())
                    $('.loading').show();
                    //meanwhile.. show the loading bar..

                    getPage();

                    return false;
                });
            });

            function pageload(hash) {
                if (hash)
                    getPage();
            }

            function getPage() {
               // var data = 'page=' + encodeURIComponent(document.location.hash);
                var d = document.location.hash; // returns #page1, #page2 etc..
                // var html_file = d.subtring(1,d.length)+'.html'
                d = d.toString();
                d = d.substring(1, d.length);
                //window.alert(data);
                //window.alert(d);
                d = d + '.html';
                //if(d.localeCompare("page1.html")==0){
                //    d = "xmlpage1.xml"
                //   window.alert(d);
               // }
                $.ajax({
                    url: d,
                    type: "GET",
                 //   data: data,
                    cache: false,
                    dataType: "html",
                    contentType: "text/html",
                    success: function (html) {
                        $('.loading').hide();
                        $('#content').html(html);
                        $('#body').fadeIn('slow');
                    }
                });
            }

        </script>

        <style>
            body {
                margin:20px 0 0 0; 
                padding:0; 
                text-align:center;
                font-family: arial;
                font-size:12px;
                background:#282828;
            }

            #wrapper {
                width:600px; 
                margin:0 auto;
            }

            #header {
                background:url(images/header1.jpg) no-repeat center center; 
                width:670px;
                height:80px;
            }

            #menu {
                list-style:none; 
                padding:0; 
                margin:60px 40px 0 0;
                float:right;
            }

            #menu li {
                float:left; 
                padding:0 12px 0 0;
            }

            #menu li a {
                color:#666; 
                font-weight: 700; 
                text-decoration:none;
            }

            #menu li a.selected {
                color:#333; 
                font-weight: 700; 
                text-decoration:underline;
            }

            #body {
                clear:both; 
                display:none;
            }

            #body .header {
                background: url(images/body_header.png) no-repeat center center;
                width:670px;
                height:28px;
            }

            #body .body {
                background: url(images/body.png) repeat-y;
                width:600px;
                padding:0 40px;
                text-align:left;
                color:#444;
            }

            #body .footer {
                background: url(images/body_footer.png) no-repeat center center;
                width:670px;
                height:24px;
            }

            .loading {
                background: url(images/load.gif) no-repeat center center;
                height:48px;
                display:none;
            }


        </style>

    </head>
    <body>

        <div id="wrapper">

            <div id="header">
                <ul id="menu">
                    <li><a href="#page1" rel="ajax">What is it?</a></li> 
                    <li><a href="#page2" rel="ajax">How does it work?</a></li> 
                    <li><a href="#page3" rel="ajax">The Java Crawler</a></li>
                    <li><a href="#page4" rel="ajax">Google Search</a></li>
                    <li><a href="#page5" rel="ajax">About Me</a></li>
                    <li><a href="SearchPage.jsp">Home</a></li>
                </ul>
            </div>
            <div class="loading"></div>
            <div id="body">
                <div class="header"></div>
                <div class="body">
                    <div id="content">
                    </div>
                </div>
                <div class="footer"></div>
            </div>
        </div>


    </body>
</html>