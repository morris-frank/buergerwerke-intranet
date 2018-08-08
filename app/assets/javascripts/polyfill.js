var BROWSER_IS_WEBKIT = /webkit/i.test(navigator.userAgent);

String.prototype.trim || (String.prototype.trim = function() {
    return String(this).replace(/^\s+|\s+$/g, '');
});

Array.prototype.indexOf || (Array.prototype.indexOf = function(d, e) {
    var a;
    if (null == this) throw new TypeError('"this" is null or not defined');
    var c = Object(this),
        b = c.length >>> 0;
    if (0 === b) return -1;
    a = +e || 0;
    Infinity === Math.abs(a) && (a = 0);
    if (a >= b) return -1;
    for (a = Math.max(0 <= a ? a : b - Math.abs(a), 0); a < b;) {
        if (a in c && c[a] === d) return a;
        a++
    }
    return -1
});

HTMLDocument.prototype.getAll || (HTMLDocument.prototype.getAll = function(s) {
    return Array.prototype.slice.call(this.querySelectorAll(s), 0);
});
