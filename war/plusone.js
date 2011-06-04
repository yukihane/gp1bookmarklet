(function() {
    var haveElement = document.getElementById('yukihane_plusone');
    if (haveElement) {
        // 既に要素挿入済みの場合はそれを表示
        haveElement.style.display = 'block';
        return;
    }

    // Bookmarklet で表示する要素
    var plusone = document.createElement("div");
    plusone.id = "yukihane_plusone";

    // 閉じるリンク
    var closeP1 = document.createElement("a");
    closeP1.href = "javascript:void(0)";
    closeP1
            .setAttribute("onClick",
                    "document.getElementById('yukihane_plusone').style.display = 'none';");
    var closeText = document.createTextNode("close");
    closeP1.appendChild(closeText);
    var closeDiv = document.createElement("div");
    closeDiv.id = "yukihane_plusone_close";
    closeDiv.appendChild(closeP1);
    plusone.appendChild(closeDiv);

    // +1 ボタン
    var iframe_url = "http://psonebookmarklet.appspot.com/plusone.jsp" + "?u="
            + encodeURIComponent(document.location.href);
    var ifr = document.createElement("iframe");
    ifr.id = "yukihane_plusone_iframe";
    ifr.src = iframe_url;
    var iframeDiv = document.createElement("div");
    iframeDiv.appendChild(ifr);
    plusone.appendChild(iframeDiv);

    // plusone.innerHTML = str;
    document.body.insertBefore(plusone, document.body.firstChild);
})();
