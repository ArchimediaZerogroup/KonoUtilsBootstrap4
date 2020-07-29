/**
 * In questo modo possiamo avere il componente elaborato sia in una situazione browser, importandolo con sprockets
 * che nella situazione attravero moduli
 */
(function (global, factory) {

  "use strict";

  if (typeof module === "object" && typeof module.exports === "object") {

    module.exports = factory(global, true);
  } else {
    factory(global);
  }

// Pass this if window is not defined yet
})(typeof window !== "undefined" ? window : this, function (global, return_module = false) {

  const b64DecodeUnicode = function (str) {
    // Going backwards: from bytestream, to percent-encoding, to original string.
    return decodeURIComponent(atob(str).split('').map(function (c) {
      return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
  }

  const KonoUtilsBootstrap4={
    b64DecodeUnicode: b64DecodeUnicode
  }

  if (return_module) {
    return KonoUtilsBootstrap4
  } else {
    global["KonoUtilsBootstrap4"] = KonoUtilsBootstrap4;
  }

})