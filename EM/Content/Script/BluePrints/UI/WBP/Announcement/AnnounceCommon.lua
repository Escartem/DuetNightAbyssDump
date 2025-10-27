local AnnounceCommon = {
  ContentUIStyle = {ImageOnly = 0, Default = 1},
  TabTag = {
    System = 1,
    Activity = 2,
    News = 3
  },
  ShowTag = {InLogin = 1, InGame = 2},
  SpecialChannelName = {bilibili = 1, wegame = 1},
  Version = "1.0.1",
  HtmlBody1 = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <base href="%s">
        <meta charset="UTF-8",>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="AnnounceWeb/Script/Announce.css?v=%s">
    </head>
    <script type="text/javascript" src="AnnounceWeb/Script/Announce.js?v=%s" charset="utf-8"></script>
    <body onselectstart="return false;" onmousedown="initdrag()" onmousemove="startdrag()" onmouseup="enddrag()" scroll=yes>
        %s
    </body>
</html>]],
  DefaultContent = [[
      
    <div class="content-container">  
        <div class="MainContent">
        <div style="height:2.2vw;"></div>
        <div class="TitleBar">%s</div>
            %s
        <div style="height:2vw;"></div>
        </div>
        <div class="right-space"></div>
    </div>
        <div class="before"></div>
        <div class="after"></div>]],
  ImageOnlyContent = [[
        <div class="MainContent">
         <div style="height:2.2vw;"></div>
        <a href="%s">
            <img src="%s">
        </a>
        </div>]],
  PlatformName = string.lower(UE4.UUIFunctionLibrary.GetDevicePlatformName(GWorld.GameInstance)),
  AnnounceWeb = UEMPathFunctionLibrary.GetProjectSavedDirectory() .. "AnnounceWeb/",
  FontTypeMap = {
    [CommonConst.SystemLanguages.CN] = "otf",
    [CommonConst.SystemLanguages.EN] = "otf",
    [CommonConst.SystemLanguages.KR] = "otf",
    [CommonConst.SystemLanguages.TC] = "ttf",
    [CommonConst.SystemLanguages.JP] = "ttf"
  },
  bUseWeb = true,
  LongYMDHMFormat = "(%d+)-(%d+)-(%d+)%s*(%d+)%s*:%s*(%d+)%s*~%s*(%d+)-(%d+)-(%d+)%s*(%d+)%s*:%s*(%d+)",
  LongTimeFormat = "(%[%s*%d+-%d+-%d+%s*%d+%s*:%s*%d+%s*~%s*%d+-%d+-%d+%s*%d+%s*:%s*%d+%s*%])",
  ShortYMDHMFormat = "(%d+)-(%d+)-(%d+)%s*(%d+)%s*:%s*(%d+)%s*~%s*(%d+)%s*:%s*(%d+)",
  ShortTimeFormat = "(%[%s*%d+-%d+-%d+%s*%d+%s*:%s*%d+%s*~%s*%d+%s*:%s*%d+%s*%])",
  OneYMDHMFormat = "(%d+)-(%d+)-(%d+)%s*(%d+)%s*:%s*(%d+)",
  OneTimeFormat = "(%[%s*%d+-%d+-%d+%s*%d+%s*:%s*%d+%s*%])"
}
AnnounceCommon.StyleToContent = {
  [AnnounceCommon.ContentUIStyle.ImageOnly] = "ImageOnly",
  [AnnounceCommon.ContentUIStyle.Default] = "AnnouncementDefaultContent"
}
AnnounceCommon.HtmlBody1 = string.format(AnnounceCommon.HtmlBody1, "%s", AnnounceCommon.Version, AnnounceCommon.Version, "%s")
_G.AnnounceCommon = AnnounceCommon
AnnounceCommon.CssContent = "@charset \"utf-8\";\n\n.content-container {\n    display: flex;\n    width: 100vw;\n    height: 100%;\n}\n\n.right-space {\n    width: 3vw;\n    background: transparent;\n}\n\n.MainContent {\n    width: 97vw;\n    /*font-size: 15pt;*/\n    font-family: \"GameFont\";\n    letter-spacing: 0.08vw;\n    color: #999999;\n    scroll-behavior: smooth;\n    user-select: none;\n    cursor: default;\n    position: relative;\n    overflow-y: auto;\n    overflow-x: hidden;\n}\n\nhtml {\n    overflow-y: auto;\n    overflow-x: hidden;\n}\n\n.MainContent img {\n    width: 94vw;\n    height: 100%;\n    display:block;\n    margin-left:auto;\n    margin-right:auto;\n    object-fit: contain;\n    border-top-left-radius: 2.4vw;\n    border-bottom-right-radius: 2.4vw;\n    justify-content: center;\n    /* border-style: ridge;\n    border-color: #a8a8a5;\n    border-width: 2px; */\n    -webkit-user-drag: none;\n    -moz-user-drag: none;\n    -ms-user-drag: none;\n}\n.MainContent a {\n    color:#8ab3f5;\n}\n/* .MainContent strong{\n    color:#FFFFFF\n} */\n.MainContent ul {\n    padding-inline-start: 4vw;\n    margin:1vw;\n}\n.MainContent ol {\n    padding-inline-start: 4vw;\n    margin:1vw;\n}\n.MainContent p {\n    margin: 1vw;\n}\n.MainContent h3{\n    margin: 1vw;\n}\n\n.before {\n    content: \"\";\n    position: fixed;\n    top: 0;\n    width: 100%;\n    height: 3vw;\n    background-image: linear-gradient(180deg, rgba(21,21,21,0.9) 0%, rgba(255, 255, 255, 0) 100%);\n    pointer-events: none;\n    user-select: none;\n}\n\n.after {\n    content: \"\";\n    position: fixed;\n    bottom: 0;\n    width: 100%;\n    height: 3vw;\n    background-image: linear-gradient(180deg, rgba(255, 255, 255, 0) 0%, rgba(21,21,21,0.9) 100%);\n    pointer-events: none;\n    user-select: none;\n}\n\n\n::-webkit-scrollbar-thumb {\n    margin-top:3vw;\n    /*\230\187\154\229\138\168\230\157\161\233\135\140\233\157\162\229\176\143\230\150\185\229\157\151*/\n    border-top-left-radius: 6px;\n    border-bottom-right-radius: 6px;\n    box-shadow : inset 0 0 1px rgba(0, 0, 0, 0.2);\n    background : #7C736E;\n    margin-bottom:1.6vw;\n}\n::-webkit-scrollbar-track {\n    margin-top:3vw;\n    /*\230\187\154\229\138\168\230\157\161\233\135\140\233\157\162\232\189\168\233\129\147*/\n    box-shadow : inset 0 0 1px rgba(0, 0, 0, 0.2);\n    border-top-left-radius: 6px;\n    border-bottom-right-radius: 6px;\n    background : #292929;\n    margin-bottom:1.6vw;\n}\n\n.TitleBar{\n    object-fit: contain;\n    border-top-width: 1vw ;\n    border-bottom-width: 1vw ;\n    border-right-width: 3vw ;\n    border-left-width: 3vw ;\n    border-style: solid;\n    border-image-source: url(\"../Image/TitleBg.png\");\n    border-image-slice: 15 15 15 15 fill;\n    border-image-width: 2.5vw;\n    font-size: 18pt;\n    color: #ffffff\n}\n"
AnnounceCommon.JsContent = "// -*- coding: utf-8 -*-\n\nfunction setScrollbarWidth() {\n     // \228\189\191\231\148\168ID\233\129\191\229\133\141\233\135\141\229\164\141\229\136\155\229\187\186\230\160\183\229\188\143\n    let styleSheet = document.getElementById('scrollbar-style');\n    if (!styleSheet) {\n        styleSheet = document.createElement('style');\n        styleSheet.id = 'scrollbar-style';\n        document.head.appendChild(styleSheet);\n    }\n    var width = document.documentElement.clientWidth / 160\n    styleSheet.type = 'text/css';\n    styleSheet.innerText = `\n            :hover::-webkit-scrollbar {\n                width: ${width}px;\n                height: ${width}px;\n                scroll-behavior: smooth;\n            }\n            ::-webkit-scrollbar:hover {\n                width: ${width}px;\n                height: ${width}px;\n                scroll-behavior: smooth;\n            }\n            ::-webkit-scrollbar{\n                width:0;\n                height:0;\n            }`;\n}\n\nfunction setAllHyperlink() {\n    var links = document.querySelectorAll('a');\n    for (var i = 0; i < links.length; i++) {\n        links[i].setAttribute('target', '_blank');\n    }\n}\n\nfunction makeFontface(){\n    const searchParams = new URLSearchParams(window.location.search)\n    var fontUrl = searchParams.get(\"fontUrl\")\n    console.log(fontUrl)\n    if(fontUrl == null) {return;}\n    var gameFont = new FontFace(\"GameFont\", `url(${fontUrl})`)\n    gameFont.display = \"block\"\n    gameFont.load().then(function(loadFace){\n        document.fonts.add(loadFace);\n    });\n}\n\nwindow.onload = () => {\n    window.onresize = ()=>{\n        setScrollbarWidth()\n    }\n    setScrollbarWidth()\n    setAllHyperlink()\n    modifyAllElement()\n}\n\nvar scrollcount = 0;\nvar dragy;\nvar scrollarrowtop;\nfunction initdrag() {\n    scrollcount = 1;\n    dragy = event.clientY;\n}\n\nfunction startdrag() {\n    if (scrollcount == 1) {\n        window.scrollBy(0, dragy - event.clientY);\n        document.body.style.cursor = 'hand';\n        dragy = event.clientY;\n    }\n}\n\nfunction enddrag() {\n    document.body.style.cursor = '';\n    scrollcount = 0;\n}\ndocument.addEventListener(\"mouseout\",function(event){\n    if(event.relatedTarget == null){\n        enddrag();\n    }\n    //else{setScrollbarWidth()}\n});\n\nfunction ptToPx(pt){\n    var ptNum = pt.substr(0,pt.length-2);\n    var pxNum = ptNum*(96/72);\n    return `${pxNum}px`\n}\n\n\nfunction modifyAllElement(){\n    const searchParams = new URLSearchParams(window.location.search)\n    var ContentSize = searchParams.get(\"ContentSize\")\n    var body = document.getElementsByTagName('body')[0]\n    travelModifyAllElement(body, ContentSize)\n}\n\nfunction travelModifyAllElement(element, ContentSize){\n    for(var i=0; i < element.children.length; i++){\n        var child = element.children[i]\n        var style = child.getAttribute(\"style\")\n        var csscls = child.getAttribute(\"class\")\n        var bHasFontSize = style!=null && style.includes(\"font-size\")\n        var bCssClsVaild = csscls!=null && (csscls ==\"MainContent\" || csscls == \"TitleBar\")\n        if( bHasFontSize|| bCssClsVaild){\n            var fontSize = window.getComputedStyle(child).fontSize;\n            var ConvScale = 1.25;\n            var realFontSize = `${fontSize.slice(0,-2)*100/ContentSize*%s*ConvScale}vw`\n            if(style) {\n                style = style.replace(/font-size:\\s*\\w+;/,`font-size:${realFontSize};`)\n            }else{\n                style = `font-size:${realFontSize}`\n            }\n            child.setAttribute(\"style\",style)\n        }\n        var href = child.getAttribute(\"href\")\n        if (href) {\n            child.addEventListener(\"click\",function(event){\n                if(window.ue) {\n                    window.ue.obj.onbeforepopup(href,\"\")\n                }\n            })\n        }\n        travelModifyAllElement(child, ContentSize);\n    }\n}\n\nmakeFontface()\n"
if AnnounceCommon.PlatformName == "ios" then
  AnnounceCommon.JsContent = string.format(AnnounceCommon.JsContent, "1.0")
else
  AnnounceCommon.JsContent = string.format(AnnounceCommon.JsContent, "0.95")
end
return AnnounceCommon
