var requirejs, require, define;
!function (ca) {
    function G(e) {
        return"[object Function]" === N.call(e)
    }

    function H(e) {
        return"[object Array]" === N.call(e)
    }

    function v(e, t) {
        if (e) {
            var n;
            for (n = 0; n < e.length && (!e[n] || !t(e[n], n, e)); n += 1);
        }
    }

    function U(e, t) {
        if (e) {
            var n;
            for (n = e.length - 1; n > -1 && (!e[n] || !t(e[n], n, e)); n -= 1);
        }
    }

    function s(e, t) {
        return ga.call(e, t)
    }

    function j(e, t) {
        return s(e, t) && e[t]
    }

    function B(e, t) {
        for (var n in e)if (s(e, n) && t(e[n], n))break
    }

    function V(e, t, n, i) {
        return t && B(t, function (t, r) {
            (n || !s(e, r)) && (!i || "object" != typeof t || !t || H(t) || G(t) || t instanceof RegExp ? e[r] = t : (e[r] || (e[r] = {}), V(e[r], t, n, i)))
        }), e
    }

    function t(e, t) {
        return function () {
            return t.apply(e, arguments)
        }
    }

    function da(e) {
        throw e
    }

    function ea(e) {
        if (!e)return e;
        var t = ca;
        return v(e.split("."), function (e) {
            t = t[e]
        }), t
    }

    function C(e, t, n, i) {
        return t = Error(t + "\nhttp://requirejs.org/docs/errors.html#" + e), t.requireType = e, t.requireModules = i, n && (t.originalError = n), t
    }

    function ha(e) {
        function n(e, t, n) {
            var i, r, o, a, s, l, u, c = t && t.split("/");
            r = c;
            var d = F.map, h = d && d["*"];
            if (e && "." === e.charAt(0))if (t) {
                for (r = c.slice(0, c.length - 1), e = e.split("/"), t = e.length - 1, F.nodeIdCompat && R.test(e[t]) && (e[t] = e[t].replace(R, "")), r = e = r.concat(e), a = r.length, t = 0; a > t; t++)if (o = r[t], "." === o)r.splice(t, 1), t -= 1; else if (".." === o) {
                    if (1 === t && (".." === r[2] || ".." === r[0]))break;
                    t > 0 && (r.splice(t - 1, 2), t -= 2)
                }
                e = e.join("/")
            } else 0 === e.indexOf("./") && (e = e.substring(2));
            if (n && d && (c || h)) {
                r = e.split("/"), t = r.length;
                e:for (; t > 0; t -= 1) {
                    if (a = r.slice(0, t).join("/"), c)for (o = c.length; o > 0; o -= 1)if ((n = j(d, c.slice(0, o).join("/"))) && (n = j(n, a))) {
                        i = n, s = t;
                        break e
                    }
                    !l && h && j(h, a) && (l = j(h, a), u = t)
                }
                !i && l && (i = l, s = u), i && (r.splice(0, s, i), e = r.join("/"))
            }
            return(i = j(F.pkgs, e)) ? i : e
        }

        function i(e) {
            z && v(document.getElementsByTagName("script"), function (t) {
                return t.getAttribute("data-requiremodule") === e && t.getAttribute("data-requirecontext") === k.contextName ? (t.parentNode.removeChild(t), !0) : void 0
            })
        }

        function r(e) {
            var t = j(F.paths, e);
            return t && H(t) && 1 < t.length ? (t.shift(), k.require.undef(e), k.require([e]), !0) : void 0
        }

        function o(e) {
            var t, n = e ? e.indexOf("!") : -1;
            return n > -1 && (t = e.substring(0, n), e = e.substring(n + 1, e.length)), [t, e]
        }

        function a(e, t, i, r) {
            var a, s, l = null, u = t ? t.name : null, c = e, d = !0, h = "";
            return e || (d = !1, e = "_@r" + (q += 1)), e = o(e), l = e[0], e = e[1], l && (l = n(l, u, r), s = j(A, l)), e && (l ? h = s && s.normalize ? s.normalize(e, function (e) {
                return n(e, u, r)
            }) : n(e, u, r) : (h = n(e, u, r), e = o(h), l = e[0], h = e[1], i = !0, a = k.nameToUrl(h))), i = !l || s || i ? "" : "_unnormalized" + (Y += 1), {prefix: l, name: h, parentMap: t, unnormalized: !!i, url: a, originalName: c, isDefine: d, id: (l ? l + "!" + h : h) + i}
        }

        function l(e) {
            var t = e.id, n = j(D, t);
            return n || (n = D[t] = new k.Module(e)), n
        }

        function u(e, t, n) {
            var i = e.id, r = j(D, i);
            !s(A, i) || r && !r.defineEmitComplete ? (r = l(e), r.error && "error" === t ? n(r.error) : r.on(t, n)) : "defined" === t && n(A[i])
        }

        function c(e, t) {
            var n = e.requireModules, i = !1;
            t ? t(e) : (v(n, function (t) {
                (t = j(D, t)) && (t.error = e, t.events.error && (i = !0, t.emit("error", e)))
            }), i || h.onError(e))
        }

        function d() {
            S.length && (ia.apply(M, [M.length, 0].concat(S)), S = [])
        }

        function f(e) {
            delete D[e], delete E[e]
        }

        function p(e, t, n) {
            var i = e.map.id;
            e.error ? e.emit("error", e.error) : (t[i] = !0, v(e.depMaps, function (i, r) {
                var o = i.id, a = j(D, o);
                a && !e.depMatched[r] && !n[o] && (j(t, o) ? (e.defineDep(r, A[o]), e.check()) : p(a, t, n))
            }), n[i] = !0)
        }

        function m() {
            var e, t, n = (e = 1e3 * F.waitSeconds) && k.startTime + e < (new Date).getTime(), o = [], a = [], s = !1, l = !0;
            if (!w) {
                if (w = !0, B(E, function (e) {
                    var u = e.map, c = u.id;
                    if (e.enabled && (u.isDefine || a.push(e), !e.error))if (!e.inited && n)r(c) ? s = t = !0 : (o.push(c), i(c)); else if (!e.inited && e.fetched && u.isDefine && (s = !0, !u.prefix))return l = !1
                }), n && o.length)return e = C("timeout", "Load timeout for modules: " + o, null, o), e.contextName = k.contextName, c(e);
                l && v(a, function (e) {
                    p(e, {}, {})
                }), n && !t || !s || !z && !fa || _ || (_ = setTimeout(function () {
                    _ = 0, m()
                }, 50)), w = !1
            }
        }

        function g(e) {
            s(A, e[0]) || l(a(e[0], null, !0)).init(e[1], e[2])
        }

        function y(e) {
            var e = e.currentTarget || e.srcElement, t = k.onScriptLoad;
            return e.detachEvent && !Z ? e.detachEvent("onreadystatechange", t) : e.removeEventListener("load", t, !1), t = k.onScriptError, (!e.detachEvent || Z) && e.removeEventListener("error", t, !1), {node: e, id: e && e.getAttribute("data-requiremodule")}
        }

        function b() {
            var e;
            for (d(); M.length;) {
                if (e = M.shift(), null === e[0])return c(C("mismatch", "Mismatched anonymous define() module: " + e[e.length - 1]));
                g(e)
            }
        }

        var w, x, k, T, _, F = {waitSeconds: 7, baseUrl: "./", paths: {}, bundles: {}, pkgs: {}, shim: {}, config: {}}, D = {}, E = {}, N = {}, M = [], A = {}, L = {}, $ = {}, q = 1, Y = 1;
        return T = {require: function (e) {
            return e.require ? e.require : e.require = k.makeRequire(e.map)
        }, exports: function (e) {
            return e.usingExports = !0, e.map.isDefine ? e.exports ? e.exports : e.exports = A[e.map.id] = {} : void 0
        }, module: function (e) {
            return e.module ? e.module : e.module = {id: e.map.id, uri: e.map.url, config: function () {
                return j(F.config, e.map.id) || {}
            }, exports: T.exports(e)}
        }}, x = function (e) {
            this.events = j(N, e.id) || {}, this.map = e, this.shim = j(F.shim, e.id), this.depExports = [], this.depMaps = [], this.depMatched = [], this.pluginMaps = {}, this.depCount = 0
        }, x.prototype = {init: function (e, n, i, r) {
            r = r || {}, this.inited || (this.factory = n, i ? this.on("error", i) : this.events.error && (i = t(this, function (e) {
                this.emit("error", e)
            })), this.depMaps = e && e.slice(0), this.errback = i, this.inited = !0, this.ignore = r.ignore, r.enabled || this.enabled ? this.enable() : this.check())
        }, defineDep: function (e, t) {
            this.depMatched[e] || (this.depMatched[e] = !0, this.depCount -= 1, this.depExports[e] = t)
        }, fetch: function () {
            if (!this.fetched) {
                this.fetched = !0, k.startTime = (new Date).getTime();
                var e = this.map;
                if (!this.shim)return e.prefix ? this.callPlugin() : this.load();
                k.makeRequire(this.map, {enableBuildCallback: !0})(this.shim.deps || [], t(this, function () {
                    return e.prefix ? this.callPlugin() : this.load()
                }))
            }
        }, load: function () {
            var e = this.map.url;
            L[e] || (L[e] = !0, k.load(this.map.id, e))
        }, check: function () {
            if (this.enabled && !this.enabling) {
                var e, t, n = this.map.id;
                t = this.depExports;
                var i = this.exports, r = this.factory;
                if (this.inited) {
                    if (this.error)this.emit("error", this.error); else if (!this.defining) {
                        if (this.defining = !0, 1 > this.depCount && !this.defined) {
                            if (G(r)) {
                                if (this.events.error && this.map.isDefine || h.onError !== da)try {
                                    i = k.execCb(n, r, t, i)
                                } catch (o) {
                                    e = o
                                } else i = k.execCb(n, r, t, i);
                                if (this.map.isDefine && void 0 === i && ((t = this.module) ? i = t.exports : this.usingExports && (i = this.exports)), e)return e.requireMap = this.map, e.requireModules = this.map.isDefine ? [this.map.id] : null, e.requireType = this.map.isDefine ? "define" : "require", c(this.error = e)
                            } else i = r;
                            this.exports = i, this.map.isDefine && !this.ignore && (A[n] = i, h.onResourceLoad) && h.onResourceLoad(k, this.map, this.depMaps), f(n), this.defined = !0
                        }
                        this.defining = !1, this.defined && !this.defineEmitted && (this.defineEmitted = !0, this.emit("defined", this.exports), this.defineEmitComplete = !0)
                    }
                } else this.fetch()
            }
        }, callPlugin: function () {
            var e = this.map, i = e.id, r = a(e.prefix);
            this.depMaps.push(r), u(r, "defined", t(this, function (r) {
                var o, d;
                d = j($, this.map.id);
                var p = this.map.name, m = this.map.parentMap ? this.map.parentMap.name : null, g = k.makeRequire(e.parentMap, {enableBuildCallback: !0});
                this.map.unnormalized ? (r.normalize && (p = r.normalize(p, function (e) {
                    return n(e, m, !0)
                }) || ""), r = a(e.prefix + "!" + p, this.map.parentMap), u(r, "defined", t(this, function (e) {
                    this.init([], function () {
                        return e
                    }, null, {enabled: !0, ignore: !0})
                })), (d = j(D, r.id)) && (this.depMaps.push(r), this.events.error && d.on("error", t(this, function (e) {
                    this.emit("error", e)
                })), d.enable())) : d ? (this.map.url = k.nameToUrl(d), this.load()) : (o = t(this, function (e) {
                    this.init([], function () {
                        return e
                    }, null, {enabled: !0})
                }), o.error = t(this, function (e) {
                    this.inited = !0, this.error = e, e.requireModules = [i], B(D, function (e) {
                        0 === e.map.id.indexOf(i + "_unnormalized") && f(e.map.id)
                    }), c(e)
                }), o.fromText = t(this, function (t, n) {
                    var r = e.name, u = a(r), d = O;
                    n && (t = n), d && (O = !1), l(u), s(F.config, i) && (F.config[r] = F.config[i]);
                    try {
                        h.exec(t)
                    } catch (f) {
                        return c(C("fromtexteval", "fromText eval for " + i + " failed: " + f, f, [i]))
                    }
                    d && (O = !0), this.depMaps.push(u), k.completeLoad(r), g([r], o)
                }), r.load(e.name, g, o, F))
            })), k.enable(r, this), this.pluginMaps[r.id] = r
        }, enable: function () {
            E[this.map.id] = this, this.enabling = this.enabled = !0, v(this.depMaps, t(this, function (e, n) {
                var i, r;
                if ("string" == typeof e) {
                    if (e = a(e, this.map.isDefine ? this.map : this.map.parentMap, !1, !this.skipMap), this.depMaps[n] = e, i = j(T, e.id))return this.depExports[n] = i(this), void 0;
                    this.depCount += 1, u(e, "defined", t(this, function (e) {
                        this.defineDep(n, e), this.check()
                    })), this.errback && u(e, "error", t(this, this.errback))
                }
                i = e.id, r = D[i], !s(T, i) && r && !r.enabled && k.enable(e, this)
            })), B(this.pluginMaps, t(this, function (e) {
                var t = j(D, e.id);
                t && !t.enabled && k.enable(e, this)
            })), this.enabling = !1, this.check()
        }, on: function (e, t) {
            var n = this.events[e];
            n || (n = this.events[e] = []), n.push(t)
        }, emit: function (e, t) {
            v(this.events[e], function (e) {
                e(t)
            }), "error" === e && delete this.events[e]
        }}, k = {config: F, contextName: e, registry: D, defined: A, urlFetched: L, defQueue: M, Module: x, makeModuleMap: a, nextTick: h.nextTick, onError: c, configure: function (e) {
            e.baseUrl && "/" !== e.baseUrl.charAt(e.baseUrl.length - 1) && (e.baseUrl += "/");
            var t = F.shim, n = {paths: !0, bundles: !0, config: !0, map: !0};
            B(e, function (e, t) {
                n[t] ? (F[t] || (F[t] = {}), V(F[t], e, !0, !0)) : F[t] = e
            }), e.bundles && B(e.bundles, function (e, t) {
                v(e, function (e) {
                    e !== t && ($[e] = t)
                })
            }), e.shim && (B(e.shim, function (e, n) {
                H(e) && (e = {deps: e}), !e.exports && !e.init || e.exportsFn || (e.exportsFn = k.makeShimExports(e)), t[n] = e
            }), F.shim = t), e.packages && v(e.packages, function (e) {
                var t, e = "string" == typeof e ? {name: e} : e;
                t = e.name, e.location && (F.paths[t] = e.location), F.pkgs[t] = e.name + "/" + (e.main || "main").replace(ja, "").replace(R, "")
            }), B(D, function (e, t) {
                !e.inited && !e.map.unnormalized && (e.map = a(t))
            }), (e.deps || e.callback) && k.require(e.deps || [], e.callback)
        }, makeShimExports: function (e) {
            return function () {
                var t;
                return e.init && (t = e.init.apply(ca, arguments)), t || e.exports && ea(e.exports)
            }
        }, makeRequire: function (t, r) {
            function o(n, i, u) {
                var d, f;
                return r.enableBuildCallback && i && G(i) && (i.__requireJsBuild = !0), "string" == typeof n ? G(i) ? c(C("requireargs", "Invalid require call"), u) : t && s(T, n) ? T[n](D[t.id]) : h.get ? h.get(k, n, t, o) : (d = a(n, t, !1, !0), d = d.id, s(A, d) ? A[d] : c(C("notloaded", 'Module name "' + d + '" has not been loaded yet for context: ' + e + (t ? "" : ". Use require([])")))) : (b(), k.nextTick(function () {
                    b(), f = l(a(null, t)), f.skipMap = r.skipMap, f.init(n, i, u, {enabled: !0}), m()
                }), o)
            }

            return r = r || {}, V(o, {isBrowser: z, toUrl: function (e) {
                var i, r = e.lastIndexOf("."), o = e.split("/")[0];
                return-1 !== r && ("." !== o && ".." !== o || r > 1) && (i = e.substring(r, e.length), e = e.substring(0, r)), k.nameToUrl(n(e, t && t.id, !0), i, !0)
            }, defined: function (e) {
                return s(A, a(e, t, !1, !0).id)
            }, specified: function (e) {
                return e = a(e, t, !1, !0).id, s(A, e) || s(D, e)
            }}), t || (o.undef = function (e) {
                d();
                var n = a(e, t, !0), r = j(D, e);
                i(e), delete A[e], delete L[n.url], delete N[e], U(M, function (t, n) {
                    t[0] === e && M.splice(n, 1)
                }), r && (r.events.defined && (N[e] = r.events), f(e))
            }), o
        }, enable: function (e) {
            j(D, e.id) && l(e).enable()
        }, completeLoad: function (e) {
            var t, n, i = j(F.shim, e) || {}, o = i.exports;
            for (d(); M.length;) {
                if (n = M.shift(), null === n[0]) {
                    if (n[0] = e, t)break;
                    t = !0
                } else n[0] === e && (t = !0);
                g(n)
            }
            if (n = j(D, e), !t && !s(A, e) && n && !n.inited) {
                if (F.enforceDefine && (!o || !ea(o)))return r(e) ? void 0 : c(C("nodefine", "No define call for " + e, null, [e]));
                g([e, i.deps || [], i.exportsFn])
            }
            m()
        }, nameToUrl: function (e, t, n) {
            var i, r, o;
            if ((i = j(F.pkgs, e)) && (e = i), i = j($, e))return k.nameToUrl(i, t, n);
            if (h.jsExtRegExp.test(e))i = e + (t || ""); else {
                for (i = F.paths, e = e.split("/"), r = e.length; r > 0; r -= 1)if (o = e.slice(0, r).join("/"), o = j(i, o)) {
                    H(o) && (o = o[0]), e.splice(0, r, o);
                    break
                }
                i = e.join("/"), i += t || (/^data\:|\?/.test(i) || n ? "" : ".js"), i = ("/" === i.charAt(0) || i.match(/^[\w\+\.\-]+:/) ? "" : F.baseUrl) + i
            }
            return F.urlArgs ? i + ((-1 === i.indexOf("?") ? "?" : "&") + F.urlArgs) : i
        }, load: function (e, t) {
            h.load(k, e, t)
        }, execCb: function (e, t, n, i) {
            return t.apply(i, n)
        }, onScriptLoad: function (e) {
            ("load" === e.type || ka.test((e.currentTarget || e.srcElement).readyState)) && (P = null, e = y(e), k.completeLoad(e.id))
        }, onScriptError: function (e) {
            var t = y(e);
            return r(t.id) ? void 0 : c(C("scripterror", "Script error for: " + t.id, e, [t.id]))
        }}, k.require = k.makeRequire(), k
    }

    var h, x, y, D, L, E, P, M, q, Q, la = /(\/\*([\s\S]*?)\*\/|([^:]|^)\/\/(.*)$)/gm, ma = /[^.]\s*require\s*\(\s*["']([^'"\s]+)["']\s*\)/g, R = /\.js$/, ja = /^\.\//;
    x = Object.prototype;
    var N = x.toString, ga = x.hasOwnProperty, ia = Array.prototype.splice, z = !("undefined" == typeof window || "undefined" == typeof navigator || !window.document), fa = !z && "undefined" != typeof importScripts, ka = z && "PLAYSTATION 3" === navigator.platform ? /^complete$/ : /^(complete|loaded)$/, Z = "undefined" != typeof opera && "[object Opera]" === opera.toString(), F = {}, r = {}, S = [], O = !1;
    if ("undefined" == typeof define) {
        if ("undefined" != typeof requirejs) {
            if (G(requirejs))return;
            r = requirejs, requirejs = void 0
        }
        "undefined" != typeof require && !G(require) && (r = require, require = void 0), h = requirejs = function (e, t, n, i) {
            var r, o = "_";
            return!H(e) && "string" != typeof e && (r = e, H(t) ? (e = t, t = n, n = i) : e = []), r && r.context && (o = r.context), (i = j(F, o)) || (i = F[o] = h.s.newContext(o)), r && i.configure(r), i.require(e, t, n)
        }, h.config = function (e) {
            return h(e)
        }, h.nextTick = "undefined" != typeof setTimeout ? function (e) {
            setTimeout(e, 4)
        } : function (e) {
            e()
        }, require || (require = h), h.version = "2.1.10", h.jsExtRegExp = /^\/|:|\?|\.js$/, h.isBrowser = z, x = h.s = {contexts: F, newContext: ha}, h({}), v(["toUrl", "undef", "defined", "specified"], function (e) {
            h[e] = function () {
                var t = F._;
                return t.require[e].apply(t, arguments)
            }
        }), z && (y = x.head = document.getElementsByTagName("head")[0], D = document.getElementsByTagName("base")[0]) && (y = x.head = D.parentNode), h.onError = da, h.createNode = function (e) {
            var t = e.xhtml ? document.createElementNS("http://www.w3.org/1999/xhtml", "html:script") : document.createElement("script");
            return t.type = e.scriptType || "text/javascript", t.charset = "utf-8", t.async = !0, t
        }, h.load = function (e, t, n) {
            var i = e && e.config || {};
            if (z)return i = h.createNode(i, t, n), i.setAttribute("data-requirecontext", e.contextName), i.setAttribute("data-requiremodule", t), !i.attachEvent || i.attachEvent.toString && 0 > i.attachEvent.toString().indexOf("[native code") || Z ? (i.addEventListener("load", e.onScriptLoad, !1), i.addEventListener("error", e.onScriptError, !1)) : (O = !0, i.attachEvent("onreadystatechange", e.onScriptLoad)), i.src = n, M = i, D ? y.insertBefore(i, D) : y.appendChild(i), M = null, i;
            if (fa)try {
                importScripts(n), e.completeLoad(t)
            } catch (r) {
                e.onError(C("importscripts", "importScripts failed for " + t + " at " + n, r, [t]))
            }
        }, z && !r.skipDataMain && U(document.getElementsByTagName("script"), function (e) {
            return y || (y = e.parentNode), (L = e.getAttribute("data-main")) ? (q = L, r.baseUrl || (E = q.split("/"), q = E.pop(), Q = E.length ? E.join("/") + "/" : "./", r.baseUrl = Q), q = q.replace(R, ""), h.jsExtRegExp.test(q) && (q = L), r.deps = r.deps ? r.deps.concat(q) : [q], !0) : void 0
        }), define = function (e, t, n) {
            var i, r;
            "string" != typeof e && (n = t, t = e, e = null), H(t) || (n = t, t = null), !t && G(n) && (t = [], n.length && (n.toString().replace(la, "").replace(ma, function (e, n) {
                t.push(n)
            }), t = (1 === n.length ? ["require"] : ["require", "exports", "module"]).concat(t))), O && ((i = M) || (P && "interactive" === P.readyState || U(document.getElementsByTagName("script"), function (e) {
                return"interactive" === e.readyState ? P = e : void 0
            }), i = P), i && (e || (e = i.getAttribute("data-requiremodule")), r = F[i.getAttribute("data-requirecontext")])), (r ? r.defQueue : S).push([e, t, n])
        }, define.amd = {jQuery: !0}, h.exec = function (b) {
            return eval(b)
        }, h(r)
    }
}(this), define("requireLib", function () {
}), !function (e) {
    function t(e, t) {
        return function (n) {
            return l(e.call(this, n), t)
        }
    }

    function n(e, t) {
        return function (n) {
            return this.lang().ordinal(e.call(this, n), t)
        }
    }

    function i() {
    }

    function r(e) {
        a(this, e)
    }

    function o(e) {
        var t = e.years || e.year || e.y || 0, n = e.months || e.month || e.M || 0, i = e.weeks || e.week || e.w || 0, r = e.days || e.day || e.d || 0, o = e.hours || e.hour || e.h || 0, a = e.minutes || e.minute || e.m || 0, s = e.seconds || e.second || e.s || 0, l = e.milliseconds || e.millisecond || e.ms || 0;
        this._input = e, this._milliseconds = l + 1e3 * s + 6e4 * a + 36e5 * o, this._days = r + 7 * i, this._months = n + 12 * t, this._data = {}, this._bubble()
    }

    function a(e, t) {
        for (var n in t)t.hasOwnProperty(n) && (e[n] = t[n]);
        return e
    }

    function s(e) {
        return 0 > e ? Math.ceil(e) : Math.floor(e)
    }

    function l(e, t) {
        for (var n = e + ""; n.length < t;)n = "0" + n;
        return n
    }

    function u(e, t, n, i) {
        var r, o, a = t._milliseconds, s = t._days, l = t._months;
        a && e._d.setTime(+e._d + a * n), (s || l) && (r = e.minute(), o = e.hour()), s && e.date(e.date() + s * n), l && e.month(e.month() + l * n), a && !i && A.updateOffset(e), (s || l) && (e.minute(r), e.hour(o))
    }

    function c(e) {
        return"[object Array]" === Object.prototype.toString.call(e)
    }

    function d(e, t) {
        var n, i = Math.min(e.length, t.length), r = Math.abs(e.length - t.length), o = 0;
        for (n = 0; i > n; n++)~~e[n] !== ~~t[n] && o++;
        return o + r
    }

    function h(e) {
        return e ? rt[e] || e.toLowerCase().replace(/(.)s$/, "$1") : e
    }

    function f(e, t) {
        return t.abbr = e, O[e] || (O[e] = new i), O[e].set(t), O[e]
    }

    function p(e) {
        if (!e)return A.fn._lang;
        if (!O[e] && q)try {
            require("./lang/" + e)
        } catch (t) {
            return A.fn._lang
        }
        return O[e]
    }

    function m(e) {
        return e.match(/\[.*\]/) ? e.replace(/^\[|\]$/g, "") : e.replace(/\\/g, "")
    }

    function g(e) {
        var t, n, i = e.match(P);
        for (t = 0, n = i.length; n > t; t++)i[t] = lt[i[t]] ? lt[i[t]] : m(i[t]);
        return function (r) {
            var o = "";
            for (t = 0; n > t; t++)o += i[t]instanceof Function ? i[t].call(r, e) : i[t];
            return o
        }
    }

    function v(e, t) {
        function n(t) {
            return e.lang().longDateFormat(t) || t
        }

        for (var i = 5; i-- && Y.test(t);)t = t.replace(Y, n);
        return ot[t] || (ot[t] = g(t)), ot[t](e)
    }

    function y(e, t) {
        switch (e) {
            case"DDDD":
                return W;
            case"YYYY":
                return U;
            case"YYYYY":
                return I;
            case"S":
            case"SS":
            case"SSS":
            case"DDD":
                return G;
            case"MMM":
            case"MMMM":
            case"dd":
            case"ddd":
            case"dddd":
                return V;
            case"a":
            case"A":
                return p(t._l)._meridiemParse;
            case"X":
                return Q;
            case"Z":
            case"ZZ":
                return X;
            case"T":
                return J;
            case"MM":
            case"DD":
            case"YY":
            case"HH":
            case"hh":
            case"mm":
            case"ss":
            case"M":
            case"D":
            case"d":
            case"H":
            case"h":
            case"m":
            case"s":
                return B;
            default:
                return new RegExp(e.replace("\\", ""))
        }
    }

    function b(e) {
        var t = (X.exec(e) || [])[0], n = (t + "").match(tt) || ["-", 0, 0], i = +(60 * n[1]) + ~~n[2];
        return"+" === n[0] ? -i : i
    }

    function w(e, t, n) {
        var i, r = n._a;
        switch (e) {
            case"M":
            case"MM":
                r[1] = null == t ? 0 : ~~t - 1;
                break;
            case"MMM":
            case"MMMM":
                i = p(n._l).monthsParse(t), null != i ? r[1] = i : n._isValid = !1;
                break;
            case"D":
            case"DD":
            case"DDD":
            case"DDDD":
                null != t && (r[2] = ~~t);
                break;
            case"YY":
                r[0] = ~~t + (~~t > 68 ? 1900 : 2e3);
                break;
            case"YYYY":
            case"YYYYY":
                r[0] = ~~t;
                break;
            case"a":
            case"A":
                n._isPm = p(n._l).isPM(t);
                break;
            case"H":
            case"HH":
            case"h":
            case"hh":
                r[3] = ~~t;
                break;
            case"m":
            case"mm":
                r[4] = ~~t;
                break;
            case"s":
            case"ss":
                r[5] = ~~t;
                break;
            case"S":
            case"SS":
            case"SSS":
                r[6] = ~~(1e3 * ("0." + t));
                break;
            case"X":
                n._d = new Date(1e3 * parseFloat(t));
                break;
            case"Z":
            case"ZZ":
                n._useUTC = !0, n._tzm = b(t)
        }
        null == t && (n._isValid = !1)
    }

    function x(e) {
        var t, n, i = [];
        if (!e._d) {
            for (t = 0; 7 > t; t++)e._a[t] = i[t] = null == e._a[t] ? 2 === t ? 1 : 0 : e._a[t];
            i[3] += ~~((e._tzm || 0) / 60), i[4] += ~~((e._tzm || 0) % 60), n = new Date(0), e._useUTC ? (n.setUTCFullYear(i[0], i[1], i[2]), n.setUTCHours(i[3], i[4], i[5], i[6])) : (n.setFullYear(i[0], i[1], i[2]), n.setHours(i[3], i[4], i[5], i[6])), e._d = n
        }
    }

    function C(e) {
        var t, n, i = e._f.match(P), r = e._i;
        for (e._a = [], t = 0; t < i.length; t++)n = (y(i[t], e).exec(r) || [])[0], n && (r = r.slice(r.indexOf(n) + n.length)), lt[i[t]] && w(i[t], n, e);
        r && (e._il = r), e._isPm && e._a[3] < 12 && (e._a[3] += 12), e._isPm === !1 && 12 === e._a[3] && (e._a[3] = 0), x(e)
    }

    function k(e) {
        var t, n, i, o, s, l = 99;
        for (o = 0; o < e._f.length; o++)t = a({}, e), t._f = e._f[o], C(t), n = new r(t), s = d(t._a, n.toArray()), n._il && (s += n._il.length), l > s && (l = s, i = n);
        a(e, i)
    }

    function T(e) {
        var t, n = e._i, i = Z.exec(n);
        if (i) {
            for (e._f = "YYYY-MM-DD" + (i[2] || " "), t = 0; 4 > t; t++)if (et[t][1].exec(n)) {
                e._f += et[t][0];
                break
            }
            X.exec(n) && (e._f += " Z"), C(e)
        } else e._d = new Date(n)
    }

    function _(t) {
        var n = t._i, i = z.exec(n);
        n === e ? t._d = new Date : i ? t._d = new Date(+i[1]) : "string" == typeof n ? T(t) : c(n) ? (t._a = n.slice(0), x(t)) : t._d = n instanceof Date ? new Date(+n) : new Date(n)
    }

    function F(e, t, n, i, r) {
        return r.relativeTime(t || 1, !!n, e, i)
    }

    function D(e, t, n) {
        var i = $(Math.abs(e) / 1e3), r = $(i / 60), o = $(r / 60), a = $(o / 24), s = $(a / 365), l = 45 > i && ["s", i] || 1 === r && ["m"] || 45 > r && ["mm", r] || 1 === o && ["h"] || 22 > o && ["hh", o] || 1 === a && ["d"] || 25 >= a && ["dd", a] || 45 >= a && ["M"] || 345 > a && ["MM", $(a / 30)] || 1 === s && ["y"] || ["yy", s];
        return l[2] = t, l[3] = e > 0, l[4] = n, F.apply({}, l)
    }

    function S(e, t, n) {
        var i, r = n - t, o = n - e.day();
        return o > r && (o -= 7), r - 7 > o && (o += 7), i = A(e).add("d", o), {week: Math.ceil(i.dayOfYear() / 7), year: i.year()}
    }

    function E(e) {
        var t = e._i, n = e._f;
        return null === t || "" === t ? null : ("string" == typeof t && (e._i = t = p().preparse(t)), A.isMoment(t) ? (e = a({}, t), e._d = new Date(+t._d)) : n ? c(n) ? k(e) : C(e) : _(e), new r(e))
    }

    function N(e, t) {
        A.fn[e] = A.fn[e + "s"] = function (e) {
            var n = this._isUTC ? "UTC" : "";
            return null != e ? (this._d["set" + n + t](e), A.updateOffset(this), this) : this._d["get" + n + t]()
        }
    }

    function M(e) {
        A.duration.fn[e] = function () {
            return this._data[e]
        }
    }

    function j(e, t) {
        A.duration.fn["as" + e] = function () {
            return+this / t
        }
    }

    for (var A, L, H = "2.1.0", $ = Math.round, O = {}, q = "undefined" != typeof module && module.exports, z = /^\/?Date\((\-?\d+)/i, R = /(\-)?(\d*)?\.?(\d+)\:(\d+)\:(\d+)\.?(\d{3})?/, P = /(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|SS?S?|X|zz?|ZZ?|.)/g, Y = /(\[[^\[]*\])|(\\)?(LT|LL?L?L?|l{1,4})/g, B = /\d\d?/, G = /\d{1,3}/, W = /\d{3}/, U = /\d{1,4}/, I = /[+\-]?\d{1,6}/, V = /[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i, X = /Z|[\+\-]\d\d:?\d\d/i, J = /T/i, Q = /[\+\-]?\d+(\.\d{1,3})?/, Z = /^\s*\d{4}-\d\d-\d\d((T| )(\d\d(:\d\d(:\d\d(\.\d\d?\d?)?)?)?)?([\+\-]\d\d:?\d\d)?)?/, K = "YYYY-MM-DDTHH:mm:ssZ", et = [
        ["HH:mm:ss.S", /(T| )\d\d:\d\d:\d\d\.\d{1,3}/],
        ["HH:mm:ss", /(T| )\d\d:\d\d:\d\d/],
        ["HH:mm", /(T| )\d\d:\d\d/],
        ["HH", /(T| )\d\d/]
    ], tt = /([\+\-]|\d\d)/gi, nt = "Date|Hours|Minutes|Seconds|Milliseconds".split("|"), it = {Milliseconds: 1, Seconds: 1e3, Minutes: 6e4, Hours: 36e5, Days: 864e5, Months: 2592e6, Years: 31536e6}, rt = {ms: "millisecond", s: "second", m: "minute", h: "hour", d: "day", w: "week", M: "month", y: "year"}, ot = {}, at = "DDD w W M D d".split(" "), st = "M D H h m s w W".split(" "), lt = {M: function () {
        return this.month() + 1
    }, MMM: function (e) {
        return this.lang().monthsShort(this, e)
    }, MMMM: function (e) {
        return this.lang().months(this, e)
    }, D: function () {
        return this.date()
    }, DDD: function () {
        return this.dayOfYear()
    }, d: function () {
        return this.day()
    }, dd: function (e) {
        return this.lang().weekdaysMin(this, e)
    }, ddd: function (e) {
        return this.lang().weekdaysShort(this, e)
    }, dddd: function (e) {
        return this.lang().weekdays(this, e)
    }, w: function () {
        return this.week()
    }, W: function () {
        return this.isoWeek()
    }, YY: function () {
        return l(this.year() % 100, 2)
    }, YYYY: function () {
        return l(this.year(), 4)
    }, YYYYY: function () {
        return l(this.year(), 5)
    }, gg: function () {
        return l(this.weekYear() % 100, 2)
    }, gggg: function () {
        return this.weekYear()
    }, ggggg: function () {
        return l(this.weekYear(), 5)
    }, GG: function () {
        return l(this.isoWeekYear() % 100, 2)
    }, GGGG: function () {
        return this.isoWeekYear()
    }, GGGGG: function () {
        return l(this.isoWeekYear(), 5)
    }, e: function () {
        return this.weekday()
    }, E: function () {
        return this.isoWeekday()
    }, a: function () {
        return this.lang().meridiem(this.hours(), this.minutes(), !0)
    }, A: function () {
        return this.lang().meridiem(this.hours(), this.minutes(), !1)
    }, H: function () {
        return this.hours()
    }, h: function () {
        return this.hours() % 12 || 12
    }, m: function () {
        return this.minutes()
    }, s: function () {
        return this.seconds()
    }, S: function () {
        return~~(this.milliseconds() / 100)
    }, SS: function () {
        return l(~~(this.milliseconds() / 10), 2)
    }, SSS: function () {
        return l(this.milliseconds(), 3)
    }, Z: function () {
        var e = -this.zone(), t = "+";
        return 0 > e && (e = -e, t = "-"), t + l(~~(e / 60), 2) + ":" + l(~~e % 60, 2)
    }, ZZ: function () {
        var e = -this.zone(), t = "+";
        return 0 > e && (e = -e, t = "-"), t + l(~~(10 * e / 6), 4)
    }, z: function () {
        return this.zoneAbbr()
    }, zz: function () {
        return this.zoneName()
    }, X: function () {
        return this.unix()
    }}; at.length;)L = at.pop(), lt[L + "o"] = n(lt[L], L);
    for (; st.length;)L = st.pop(), lt[L + L] = t(lt[L], 2);
    for (lt.DDDD = t(lt.DDD, 3), i.prototype = {set: function (e) {
        var t, n;
        for (n in e)t = e[n], "function" == typeof t ? this[n] = t : this["_" + n] = t
    }, _months: "January_February_March_April_May_June_July_August_September_October_November_December".split("_"), months: function (e) {
        return this._months[e.month()]
    }, _monthsShort: "Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"), monthsShort: function (e) {
        return this._monthsShort[e.month()]
    }, monthsParse: function (e) {
        var t, n, i;
        for (this._monthsParse || (this._monthsParse = []), t = 0; 12 > t; t++)if (this._monthsParse[t] || (n = A([2e3, t]), i = "^" + this.months(n, "") + "|^" + this.monthsShort(n, ""), this._monthsParse[t] = new RegExp(i.replace(".", ""), "i")), this._monthsParse[t].test(e))return t
    }, _weekdays: "Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"), weekdays: function (e) {
        return this._weekdays[e.day()]
    }, _weekdaysShort: "Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"), weekdaysShort: function (e) {
        return this._weekdaysShort[e.day()]
    }, _weekdaysMin: "Su_Mo_Tu_We_Th_Fr_Sa".split("_"), weekdaysMin: function (e) {
        return this._weekdaysMin[e.day()]
    }, weekdaysParse: function (e) {
        var t, n, i;
        for (this._weekdaysParse || (this._weekdaysParse = []), t = 0; 7 > t; t++)if (this._weekdaysParse[t] || (n = A([2e3, 1]).day(t), i = "^" + this.weekdays(n, "") + "|^" + this.weekdaysShort(n, "") + "|^" + this.weekdaysMin(n, ""), this._weekdaysParse[t] = new RegExp(i.replace(".", ""), "i")), this._weekdaysParse[t].test(e))return t
    }, _longDateFormat: {LT: "h:mm A", L: "MM/DD/YYYY", LL: "MMMM D YYYY", LLL: "MMMM D YYYY LT", LLLL: "dddd, MMMM D YYYY LT"}, longDateFormat: function (e) {
        var t = this._longDateFormat[e];
        return!t && this._longDateFormat[e.toUpperCase()] && (t = this._longDateFormat[e.toUpperCase()].replace(/MMMM|MM|DD|dddd/g, function (e) {
            return e.slice(1)
        }), this._longDateFormat[e] = t), t
    }, isPM: function (e) {
        return"p" === (e + "").toLowerCase()[0]
    }, _meridiemParse: /[ap]\.?m?\.?/i, meridiem: function (e, t, n) {
        return e > 11 ? n ? "pm" : "PM" : n ? "am" : "AM"
    }, _calendar: {sameDay: "[Today at] LT", nextDay: "[Tomorrow at] LT", nextWeek: "dddd [at] LT", lastDay: "[Yesterday at] LT", lastWeek: "[Last] dddd [at] LT", sameElse: "L"}, calendar: function (e, t) {
        var n = this._calendar[e];
        return"function" == typeof n ? n.apply(t) : n
    }, _relativeTime: {future: "in %s", past: "%s ago", s: "a few seconds", m: "a minute", mm: "%d minutes", h: "an hour", hh: "%d hours", d: "a day", dd: "%d days", M: "a month", MM: "%d months", y: "a year", yy: "%d years"}, relativeTime: function (e, t, n, i) {
        var r = this._relativeTime[n];
        return"function" == typeof r ? r(e, t, n, i) : r.replace(/%d/i, e)
    }, pastFuture: function (e, t) {
        var n = this._relativeTime[e > 0 ? "future" : "past"];
        return"function" == typeof n ? n(t) : n.replace(/%s/i, t)
    }, ordinal: function (e) {
        return this._ordinal.replace("%d", e)
    }, _ordinal: "%d", preparse: function (e) {
        return e
    }, postformat: function (e) {
        return e
    }, week: function (e) {
        return S(e, this._week.dow, this._week.doy).week
    }, _week: {dow: 0, doy: 6}}, A = function (e, t, n) {
        return E({_i: e, _f: t, _l: n, _isUTC: !1})
    }, A.utc = function (e, t, n) {
        return E({_useUTC: !0, _isUTC: !0, _l: n, _i: e, _f: t})
    }, A.unix = function (e) {
        return A(1e3 * e)
    }, A.duration = function (e, t) {
        var n, i, r = A.isDuration(e), a = "number" == typeof e, s = r ? e._input : a ? {} : e, l = R.exec(e);
        return a ? t ? s[t] = e : s.milliseconds = e : l && (n = "-" === l[1] ? -1 : 1, s = {y: 0, d: ~~l[2] * n, h: ~~l[3] * n, m: ~~l[4] * n, s: ~~l[5] * n, ms: ~~l[6] * n}), i = new o(s), r && e.hasOwnProperty("_lang") && (i._lang = e._lang), i
    }, A.version = H, A.defaultFormat = K, A.updateOffset = function () {
    }, A.lang = function (e, t) {
        return e ? (t ? f(e, t) : O[e] || p(e), A.duration.fn._lang = A.fn._lang = p(e), void 0) : A.fn._lang._abbr
    }, A.langData = function (e) {
        return e && e._lang && e._lang._abbr && (e = e._lang._abbr), p(e)
    }, A.isMoment = function (e) {
        return e instanceof r
    }, A.isDuration = function (e) {
        return e instanceof o
    }, A.fn = r.prototype = {clone: function () {
        return A(this)
    }, valueOf: function () {
        return+this._d + 6e4 * (this._offset || 0)
    }, unix: function () {
        return Math.floor(+this / 1e3)
    }, toString: function () {
        return this.format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ")
    }, toDate: function () {
        return this._offset ? new Date(+this) : this._d
    }, toISOString: function () {
        return v(A(this).utc(), "YYYY-MM-DD[T]HH:mm:ss.SSS[Z]")
    }, toArray: function () {
        var e = this;
        return[e.year(), e.month(), e.date(), e.hours(), e.minutes(), e.seconds(), e.milliseconds()]
    }, isValid: function () {
        return null == this._isValid && (this._isValid = this._a ? !d(this._a, (this._isUTC ? A.utc(this._a) : A(this._a)).toArray()) : !isNaN(this._d.getTime())), !!this._isValid
    }, utc: function () {
        return this.zone(0)
    }, local: function () {
        return this.zone(0), this._isUTC = !1, this
    }, format: function (e) {
        var t = v(this, e || A.defaultFormat);
        return this.lang().postformat(t)
    }, add: function (e, t) {
        var n;
        return n = "string" == typeof e ? A.duration(+t, e) : A.duration(e, t), u(this, n, 1), this
    }, subtract: function (e, t) {
        var n;
        return n = "string" == typeof e ? A.duration(+t, e) : A.duration(e, t), u(this, n, -1), this
    }, diff: function (e, t, n) {
        var i, r, o = this._isUTC ? A(e).zone(this._offset || 0) : A(e).local(), a = 6e4 * (this.zone() - o.zone());
        return t = h(t), "year" === t || "month" === t ? (i = 432e5 * (this.daysInMonth() + o.daysInMonth()), r = 12 * (this.year() - o.year()) + (this.month() - o.month()), r += (this - A(this).startOf("month") - (o - A(o).startOf("month"))) / i, r -= 6e4 * (this.zone() - A(this).startOf("month").zone() - (o.zone() - A(o).startOf("month").zone())) / i, "year" === t && (r /= 12)) : (i = this - o, r = "second" === t ? i / 1e3 : "minute" === t ? i / 6e4 : "hour" === t ? i / 36e5 : "day" === t ? (i - a) / 864e5 : "week" === t ? (i - a) / 6048e5 : i), n ? r : s(r)
    }, from: function (e, t) {
        return A.duration(this.diff(e)).lang(this.lang()._abbr).humanize(!t)
    }, fromNow: function (e) {
        return this.from(A(), e)
    }, calendar: function () {
        var e = this.diff(A().startOf("day"), "days", !0), t = -6 > e ? "sameElse" : -1 > e ? "lastWeek" : 0 > e ? "lastDay" : 1 > e ? "sameDay" : 2 > e ? "nextDay" : 7 > e ? "nextWeek" : "sameElse";
        return this.format(this.lang().calendar(t, this))
    }, isLeapYear: function () {
        var e = this.year();
        return 0 === e % 4 && 0 !== e % 100 || 0 === e % 400
    }, isDST: function () {
        return this.zone() < this.clone().month(0).zone() || this.zone() < this.clone().month(5).zone()
    }, day: function (e) {
        var t = this._isUTC ? this._d.getUTCDay() : this._d.getDay();
        return null != e ? "string" == typeof e && (e = this.lang().weekdaysParse(e), "number" != typeof e) ? this : this.add({d: e - t}) : t
    }, month: function (e) {
        var t, n = this._isUTC ? "UTC" : "";
        return null != e ? "string" == typeof e && (e = this.lang().monthsParse(e), "number" != typeof e) ? this : (t = this.date(), this.date(1), this._d["set" + n + "Month"](e), this.date(Math.min(t, this.daysInMonth())), A.updateOffset(this), this) : this._d["get" + n + "Month"]()
    }, startOf: function (e) {
        switch (e = h(e)) {
            case"year":
                this.month(0);
            case"month":
                this.date(1);
            case"week":
            case"day":
                this.hours(0);
            case"hour":
                this.minutes(0);
            case"minute":
                this.seconds(0);
            case"second":
                this.milliseconds(0)
        }
        return"week" === e && this.weekday(0), this
    }, endOf: function (e) {
        return this.startOf(e).add(e, 1).subtract("ms", 1)
    }, isAfter: function (e, t) {
        return t = "undefined" != typeof t ? t : "millisecond", +this.clone().startOf(t) > +A(e).startOf(t)
    }, isBefore: function (e, t) {
        return t = "undefined" != typeof t ? t : "millisecond", +this.clone().startOf(t) < +A(e).startOf(t)
    }, isSame: function (e, t) {
        return t = "undefined" != typeof t ? t : "millisecond", +this.clone().startOf(t) === +A(e).startOf(t)
    }, min: function (e) {
        return e = A.apply(null, arguments), this > e ? this : e
    }, max: function (e) {
        return e = A.apply(null, arguments), e > this ? this : e
    }, zone: function (e) {
        var t = this._offset || 0;
        return null == e ? this._isUTC ? t : this._d.getTimezoneOffset() : ("string" == typeof e && (e = b(e)), Math.abs(e) < 16 && (e = 60 * e), this._offset = e, this._isUTC = !0, t !== e && u(this, A.duration(t - e, "m"), 1, !0), this)
    }, zoneAbbr: function () {
        return this._isUTC ? "UTC" : ""
    }, zoneName: function () {
        return this._isUTC ? "Coordinated Universal Time" : ""
    }, daysInMonth: function () {
        return A.utc([this.year(), this.month() + 1, 0]).date()
    }, dayOfYear: function (e) {
        var t = $((A(this).startOf("day") - A(this).startOf("year")) / 864e5) + 1;
        return null == e ? t : this.add("d", e - t)
    }, weekYear: function (e) {
        var t = S(this, this.lang()._week.dow, this.lang()._week.doy).year;
        return null == e ? t : this.add("y", e - t)
    }, isoWeekYear: function (e) {
        var t = S(this, 1, 4).year;
        return null == e ? t : this.add("y", e - t)
    }, week: function (e) {
        var t = this.lang().week(this);
        return null == e ? t : this.add("d", 7 * (e - t))
    }, isoWeek: function (e) {
        var t = S(this, 1, 4).week;
        return null == e ? t : this.add("d", 7 * (e - t))
    }, weekday: function (e) {
        var t = (this._d.getDay() + 7 - this.lang()._week.dow) % 7;
        return null == e ? t : this.add("d", e - t)
    }, isoWeekday: function (e) {
        return null == e ? this.day() || 7 : this.day(this.day() % 7 ? e : e - 7)
    }, lang: function (t) {
        return t === e ? this._lang : (this._lang = p(t), this)
    }}, L = 0; L < nt.length; L++)N(nt[L].toLowerCase().replace(/s$/, ""), nt[L]);
    N("year", "FullYear"), A.fn.days = A.fn.day, A.fn.months = A.fn.month, A.fn.weeks = A.fn.week, A.fn.isoWeeks = A.fn.isoWeek, A.fn.toJSON = A.fn.toISOString, A.duration.fn = o.prototype = {_bubble: function () {
        var e, t, n, i, r = this._milliseconds, o = this._days, a = this._months, l = this._data;
        l.milliseconds = r % 1e3, e = s(r / 1e3), l.seconds = e % 60, t = s(e / 60), l.minutes = t % 60, n = s(t / 60), l.hours = n % 24, o += s(n / 24), l.days = o % 30, a += s(o / 30), l.months = a % 12, i = s(a / 12), l.years = i
    }, weeks: function () {
        return s(this.days() / 7)
    }, valueOf: function () {
        return this._milliseconds + 864e5 * this._days + 2592e6 * (this._months % 12) + 31536e6 * ~~(this._months / 12)
    }, humanize: function (e) {
        var t = +this, n = D(t, !e, this.lang());
        return e && (n = this.lang().pastFuture(t, n)), this.lang().postformat(n)
    }, add: function (e, t) {
        var n = A.duration(e, t);
        return this._milliseconds += n._milliseconds, this._days += n._days, this._months += n._months, this._bubble(), this
    }, subtract: function (e, t) {
        var n = A.duration(e, t);
        return this._milliseconds -= n._milliseconds, this._days -= n._days, this._months -= n._months, this._bubble(), this
    }, get: function (e) {
        return e = h(e), this[e.toLowerCase() + "s"]()
    }, as: function (e) {
        return e = h(e), this["as" + e.charAt(0).toUpperCase() + e.slice(1) + "s"]()
    }, lang: A.fn.lang};
    for (L in it)it.hasOwnProperty(L) && (j(L, it[L]), M(L.toLowerCase()));
    j("Weeks", 6048e5), A.duration.fn.asMonths = function () {
        return(+this - 31536e6 * this.years()) / 2592e6 + 12 * this.years()
    }, A.lang("en", {ordinal: function (e) {
        var t = e % 10, n = 1 === ~~(e % 100 / 10) ? "th" : 1 === t ? "st" : 2 === t ? "nd" : 3 === t ? "rd" : "th";
        return e + n
    }}), q && (module.exports = A), "undefined" == typeof ender && (this.moment = A), "function" == typeof define && define.amd && define("moment", [], function () {
        return A
    })
}.call(this), !function () {
    var e = this, t = e._, n = {}, i = Array.prototype, r = Object.prototype, o = Function.prototype, a = i.push, s = i.slice, l = i.concat, u = r.toString, c = r.hasOwnProperty, d = i.forEach, h = i.map, f = i.reduce, p = i.reduceRight, m = i.filter, g = i.every, v = i.some, y = i.indexOf, b = i.lastIndexOf, w = Array.isArray, x = Object.keys, C = o.bind, k = function (e) {
        return e instanceof k ? e : this instanceof k ? (this._wrapped = e, void 0) : new k(e)
    };
    "undefined" != typeof exports ? ("undefined" != typeof module && module.exports && (exports = module.exports = k), exports._ = k) : e._ = k, k.VERSION = "1.5.1";
    var T = k.each = k.forEach = function (e, t, i) {
        if (null != e)if (d && e.forEach === d)e.forEach(t, i); else if (e.length === +e.length) {
            for (var r = 0, o = e.length; o > r; r++)if (t.call(i, e[r], r, e) === n)return
        } else for (var a in e)if (k.has(e, a) && t.call(i, e[a], a, e) === n)return
    };
    k.map = k.collect = function (e, t, n) {
        var i = [];
        return null == e ? i : h && e.map === h ? e.map(t, n) : (T(e, function (e, r, o) {
            i.push(t.call(n, e, r, o))
        }), i)
    };
    var _ = "Reduce of empty array with no initial value";
    k.reduce = k.foldl = k.inject = function (e, t, n, i) {
        var r = arguments.length > 2;
        if (null == e && (e = []), f && e.reduce === f)return i && (t = k.bind(t, i)), r ? e.reduce(t, n) : e.reduce(t);
        if (T(e, function (e, o, a) {
            r ? n = t.call(i, n, e, o, a) : (n = e, r = !0)
        }), !r)throw new TypeError(_);
        return n
    }, k.reduceRight = k.foldr = function (e, t, n, i) {
        var r = arguments.length > 2;
        if (null == e && (e = []), p && e.reduceRight === p)return i && (t = k.bind(t, i)), r ? e.reduceRight(t, n) : e.reduceRight(t);
        var o = e.length;
        if (o !== +o) {
            var a = k.keys(e);
            o = a.length
        }
        if (T(e, function (s, l, u) {
            l = a ? a[--o] : --o, r ? n = t.call(i, n, e[l], l, u) : (n = e[l], r = !0)
        }), !r)throw new TypeError(_);
        return n
    }, k.find = k.detect = function (e, t, n) {
        var i;
        return F(e, function (e, r, o) {
            return t.call(n, e, r, o) ? (i = e, !0) : void 0
        }), i
    }, k.filter = k.select = function (e, t, n) {
        var i = [];
        return null == e ? i : m && e.filter === m ? e.filter(t, n) : (T(e, function (e, r, o) {
            t.call(n, e, r, o) && i.push(e)
        }), i)
    }, k.reject = function (e, t, n) {
        return k.filter(e, function (e, i, r) {
            return!t.call(n, e, i, r)
        }, n)
    }, k.every = k.all = function (e, t, i) {
        t || (t = k.identity);
        var r = !0;
        return null == e ? r : g && e.every === g ? e.every(t, i) : (T(e, function (e, o, a) {
            return(r = r && t.call(i, e, o, a)) ? void 0 : n
        }), !!r)
    };
    var F = k.some = k.any = function (e, t, i) {
        t || (t = k.identity);
        var r = !1;
        return null == e ? r : v && e.some === v ? e.some(t, i) : (T(e, function (e, o, a) {
            return r || (r = t.call(i, e, o, a)) ? n : void 0
        }), !!r)
    };
    k.contains = k.include = function (e, t) {
        return null == e ? !1 : y && e.indexOf === y ? -1 != e.indexOf(t) : F(e, function (e) {
            return e === t
        })
    }, k.invoke = function (e, t) {
        var n = s.call(arguments, 2), i = k.isFunction(t);
        return k.map(e, function (e) {
            return(i ? t : e[t]).apply(e, n)
        })
    }, k.pluck = function (e, t) {
        return k.map(e, function (e) {
            return e[t]
        })
    }, k.where = function (e, t, n) {
        return k.isEmpty(t) ? n ? void 0 : [] : k[n ? "find" : "filter"](e, function (e) {
            for (var n in t)if (t[n] !== e[n])return!1;
            return!0
        })
    }, k.findWhere = function (e, t) {
        return k.where(e, t, !0)
    }, k.max = function (e, t, n) {
        if (!t && k.isArray(e) && e[0] === +e[0] && e.length < 65535)return Math.max.apply(Math, e);
        if (!t && k.isEmpty(e))return-1 / 0;
        var i = {computed: -1 / 0, value: -1 / 0};
        return T(e, function (e, r, o) {
            var a = t ? t.call(n, e, r, o) : e;
            a > i.computed && (i = {value: e, computed: a})
        }), i.value
    }, k.min = function (e, t, n) {
        if (!t && k.isArray(e) && e[0] === +e[0] && e.length < 65535)return Math.min.apply(Math, e);
        if (!t && k.isEmpty(e))return 1 / 0;
        var i = {computed: 1 / 0, value: 1 / 0};
        return T(e, function (e, r, o) {
            var a = t ? t.call(n, e, r, o) : e;
            a < i.computed && (i = {value: e, computed: a})
        }), i.value
    }, k.shuffle = function (e) {
        var t, n = 0, i = [];
        return T(e, function (e) {
            t = k.random(n++), i[n - 1] = i[t], i[t] = e
        }), i
    };
    var D = function (e) {
        return k.isFunction(e) ? e : function (t) {
            return t[e]
        }
    };
    k.sortBy = function (e, t, n) {
        var i = D(t);
        return k.pluck(k.map(e,function (e, t, r) {
            return{value: e, index: t, criteria: i.call(n, e, t, r)}
        }).sort(function (e, t) {
            var n = e.criteria, i = t.criteria;
            if (n !== i) {
                if (n > i || void 0 === n)return 1;
                if (i > n || void 0 === i)return-1
            }
            return e.index < t.index ? -1 : 1
        }), "value")
    };
    var S = function (e, t, n, i) {
        var r = {}, o = D(null == t ? k.identity : t);
        return T(e, function (t, a) {
            var s = o.call(n, t, a, e);
            i(r, s, t)
        }), r
    };
    k.groupBy = function (e, t, n) {
        return S(e, t, n, function (e, t, n) {
            (k.has(e, t) ? e[t] : e[t] = []).push(n)
        })
    }, k.countBy = function (e, t, n) {
        return S(e, t, n, function (e, t) {
            k.has(e, t) || (e[t] = 0), e[t]++
        })
    }, k.sortedIndex = function (e, t, n, i) {
        n = null == n ? k.identity : D(n);
        for (var r = n.call(i, t), o = 0, a = e.length; a > o;) {
            var s = o + a >>> 1;
            n.call(i, e[s]) < r ? o = s + 1 : a = s
        }
        return o
    }, k.toArray = function (e) {
        return e ? k.isArray(e) ? s.call(e) : e.length === +e.length ? k.map(e, k.identity) : k.values(e) : []
    }, k.size = function (e) {
        return null == e ? 0 : e.length === +e.length ? e.length : k.keys(e).length
    }, k.first = k.head = k.take = function (e, t, n) {
        return null == e ? void 0 : null == t || n ? e[0] : s.call(e, 0, t)
    }, k.initial = function (e, t, n) {
        return s.call(e, 0, e.length - (null == t || n ? 1 : t))
    }, k.last = function (e, t, n) {
        return null == e ? void 0 : null == t || n ? e[e.length - 1] : s.call(e, Math.max(e.length - t, 0))
    }, k.rest = k.tail = k.drop = function (e, t, n) {
        return s.call(e, null == t || n ? 1 : t)
    }, k.compact = function (e) {
        return k.filter(e, k.identity)
    };
    var E = function (e, t, n) {
        return t && k.every(e, k.isArray) ? l.apply(n, e) : (T(e, function (e) {
            k.isArray(e) || k.isArguments(e) ? t ? a.apply(n, e) : E(e, t, n) : n.push(e)
        }), n)
    };
    k.flatten = function (e, t) {
        return E(e, t, [])
    }, k.without = function (e) {
        return k.difference(e, s.call(arguments, 1))
    }, k.uniq = k.unique = function (e, t, n, i) {
        k.isFunction(t) && (i = n, n = t, t = !1);
        var r = n ? k.map(e, n, i) : e, o = [], a = [];
        return T(r, function (n, i) {
            (t ? i && a[a.length - 1] === n : k.contains(a, n)) || (a.push(n), o.push(e[i]))
        }), o
    }, k.union = function () {
        return k.uniq(k.flatten(arguments, !0))
    }, k.intersection = function (e) {
        var t = s.call(arguments, 1);
        return k.filter(k.uniq(e), function (e) {
            return k.every(t, function (t) {
                return k.indexOf(t, e) >= 0
            })
        })
    }, k.difference = function (e) {
        var t = l.apply(i, s.call(arguments, 1));
        return k.filter(e, function (e) {
            return!k.contains(t, e)
        })
    }, k.zip = function () {
        for (var e = k.max(k.pluck(arguments, "length").concat(0)), t = new Array(e), n = 0; e > n; n++)t[n] = k.pluck(arguments, "" + n);
        return t
    }, k.object = function (e, t) {
        if (null == e)return{};
        for (var n = {}, i = 0, r = e.length; r > i; i++)t ? n[e[i]] = t[i] : n[e[i][0]] = e[i][1];
        return n
    }, k.indexOf = function (e, t, n) {
        if (null == e)return-1;
        var i = 0, r = e.length;
        if (n) {
            if ("number" != typeof n)return i = k.sortedIndex(e, t), e[i] === t ? i : -1;
            i = 0 > n ? Math.max(0, r + n) : n
        }
        if (y && e.indexOf === y)return e.indexOf(t, n);
        for (; r > i; i++)if (e[i] === t)return i;
        return-1
    }, k.lastIndexOf = function (e, t, n) {
        if (null == e)return-1;
        var i = null != n;
        if (b && e.lastIndexOf === b)return i ? e.lastIndexOf(t, n) : e.lastIndexOf(t);
        for (var r = i ? n : e.length; r--;)if (e[r] === t)return r;
        return-1
    }, k.range = function (e, t, n) {
        arguments.length <= 1 && (t = e || 0, e = 0), n = arguments[2] || 1;
        for (var i = Math.max(Math.ceil((t - e) / n), 0), r = 0, o = new Array(i); i > r;)o[r++] = e, e += n;
        return o
    };
    var N = function () {
    };
    k.bind = function (e, t) {
        var n, i;
        if (C && e.bind === C)return C.apply(e, s.call(arguments, 1));
        if (!k.isFunction(e))throw new TypeError;
        return n = s.call(arguments, 2), i = function () {
            if (!(this instanceof i))return e.apply(t, n.concat(s.call(arguments)));
            N.prototype = e.prototype;
            var r = new N;
            N.prototype = null;
            var o = e.apply(r, n.concat(s.call(arguments)));
            return Object(o) === o ? o : r
        }
    }, k.partial = function (e) {
        var t = s.call(arguments, 1);
        return function () {
            return e.apply(this, t.concat(s.call(arguments)))
        }
    }, k.bindAll = function (e) {
        var t = s.call(arguments, 1);
        if (0 === t.length)throw new Error("bindAll must be passed function names");
        return T(t, function (t) {
            e[t] = k.bind(e[t], e)
        }), e
    }, k.memoize = function (e, t) {
        var n = {};
        return t || (t = k.identity), function () {
            var i = t.apply(this, arguments);
            return k.has(n, i) ? n[i] : n[i] = e.apply(this, arguments)
        }
    }, k.delay = function (e, t) {
        var n = s.call(arguments, 2);
        return setTimeout(function () {
            return e.apply(null, n)
        }, t)
    }, k.defer = function (e) {
        return k.delay.apply(k, [e, 1].concat(s.call(arguments, 1)))
    }, k.throttle = function (e, t, n) {
        var i, r, o, a = null, s = 0;
        n || (n = {});
        var l = function () {
            s = n.leading === !1 ? 0 : new Date, a = null, o = e.apply(i, r)
        };
        return function () {
            var u = new Date;
            s || n.leading !== !1 || (s = u);
            var c = t - (u - s);
            return i = this, r = arguments, 0 >= c ? (clearTimeout(a), a = null, s = u, o = e.apply(i, r)) : a || n.trailing === !1 || (a = setTimeout(l, c)), o
        }
    }, k.debounce = function (e, t, n) {
        var i, r = null;
        return function () {
            var o = this, a = arguments, s = function () {
                r = null, n || (i = e.apply(o, a))
            }, l = n && !r;
            return clearTimeout(r), r = setTimeout(s, t), l && (i = e.apply(o, a)), i
        }
    }, k.once = function (e) {
        var t, n = !1;
        return function () {
            return n ? t : (n = !0, t = e.apply(this, arguments), e = null, t)
        }
    }, k.wrap = function (e, t) {
        return function () {
            var n = [e];
            return a.apply(n, arguments), t.apply(this, n)
        }
    }, k.compose = function () {
        var e = arguments;
        return function () {
            for (var t = arguments, n = e.length - 1; n >= 0; n--)t = [e[n].apply(this, t)];
            return t[0]
        }
    }, k.after = function (e, t) {
        return function () {
            return--e < 1 ? t.apply(this, arguments) : void 0
        }
    }, k.keys = x || function (e) {
        if (e !== Object(e))throw new TypeError("Invalid object");
        var t = [];
        for (var n in e)k.has(e, n) && t.push(n);
        return t
    }, k.values = function (e) {
        var t = [];
        for (var n in e)k.has(e, n) && t.push(e[n]);
        return t
    }, k.pairs = function (e) {
        var t = [];
        for (var n in e)k.has(e, n) && t.push([n, e[n]]);
        return t
    }, k.invert = function (e) {
        var t = {};
        for (var n in e)k.has(e, n) && (t[e[n]] = n);
        return t
    }, k.functions = k.methods = function (e) {
        var t = [];
        for (var n in e)k.isFunction(e[n]) && t.push(n);
        return t.sort()
    }, k.extend = function (e) {
        return T(s.call(arguments, 1), function (t) {
            if (t)for (var n in t)e[n] = t[n]
        }), e
    }, k.pick = function (e) {
        var t = {}, n = l.apply(i, s.call(arguments, 1));
        return T(n, function (n) {
            n in e && (t[n] = e[n])
        }), t
    }, k.omit = function (e) {
        var t = {}, n = l.apply(i, s.call(arguments, 1));
        for (var r in e)k.contains(n, r) || (t[r] = e[r]);
        return t
    }, k.defaults = function (e) {
        return T(s.call(arguments, 1), function (t) {
            if (t)for (var n in t)void 0 === e[n] && (e[n] = t[n])
        }), e
    }, k.clone = function (e) {
        return k.isObject(e) ? k.isArray(e) ? e.slice() : k.extend({}, e) : e
    }, k.tap = function (e, t) {
        return t(e), e
    };
    var M = function (e, t, n, i) {
        if (e === t)return 0 !== e || 1 / e == 1 / t;
        if (null == e || null == t)return e === t;
        e instanceof k && (e = e._wrapped), t instanceof k && (t = t._wrapped);
        var r = u.call(e);
        if (r != u.call(t))return!1;
        switch (r) {
            case"[object String]":
                return e == String(t);
            case"[object Number]":
                return e != +e ? t != +t : 0 == e ? 1 / e == 1 / t : e == +t;
            case"[object Date]":
            case"[object Boolean]":
                return+e == +t;
            case"[object RegExp]":
                return e.source == t.source && e.global == t.global && e.multiline == t.multiline && e.ignoreCase == t.ignoreCase
        }
        if ("object" != typeof e || "object" != typeof t)return!1;
        for (var o = n.length; o--;)if (n[o] == e)return i[o] == t;
        var a = e.constructor, s = t.constructor;
        if (a !== s && !(k.isFunction(a) && a instanceof a && k.isFunction(s) && s instanceof s))return!1;
        n.push(e), i.push(t);
        var l = 0, c = !0;
        if ("[object Array]" == r) {
            if (l = e.length, c = l == t.length)for (; l-- && (c = M(e[l], t[l], n, i)););
        } else {
            for (var d in e)if (k.has(e, d) && (l++, !(c = k.has(t, d) && M(e[d], t[d], n, i))))break;
            if (c) {
                for (d in t)if (k.has(t, d) && !l--)break;
                c = !l
            }
        }
        return n.pop(), i.pop(), c
    };
    k.isEqual = function (e, t) {
        return M(e, t, [], [])
    }, k.isEmpty = function (e) {
        if (null == e)return!0;
        if (k.isArray(e) || k.isString(e))return 0 === e.length;
        for (var t in e)if (k.has(e, t))return!1;
        return!0
    }, k.isElement = function (e) {
        return!(!e || 1 !== e.nodeType)
    }, k.isArray = w || function (e) {
        return"[object Array]" == u.call(e)
    }, k.isObject = function (e) {
        return e === Object(e)
    }, T(["Arguments", "Function", "String", "Number", "Date", "RegExp"], function (e) {
        k["is" + e] = function (t) {
            return u.call(t) == "[object " + e + "]"
        }
    }), k.isArguments(arguments) || (k.isArguments = function (e) {
        return!(!e || !k.has(e, "callee"))
    }), "function" != typeof/./ && (k.isFunction = function (e) {
        return"function" == typeof e
    }), k.isFinite = function (e) {
        return isFinite(e) && !isNaN(parseFloat(e))
    }, k.isNaN = function (e) {
        return k.isNumber(e) && e != +e
    }, k.isBoolean = function (e) {
        return e === !0 || e === !1 || "[object Boolean]" == u.call(e)
    }, k.isNull = function (e) {
        return null === e
    }, k.isUndefined = function (e) {
        return void 0 === e
    }, k.has = function (e, t) {
        return c.call(e, t)
    }, k.noConflict = function () {
        return e._ = t, this
    }, k.identity = function (e) {
        return e
    }, k.times = function (e, t, n) {
        for (var i = Array(Math.max(0, e)), r = 0; e > r; r++)i[r] = t.call(n, r);
        return i
    }, k.random = function (e, t) {
        return null == t && (t = e, e = 0), e + Math.floor(Math.random() * (t - e + 1))
    };
    var j = {escape: {"&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#x27;", "/": "&#x2F;"}};
    j.unescape = k.invert(j.escape);
    var A = {escape: new RegExp("[" + k.keys(j.escape).join("") + "]", "g"), unescape: new RegExp("(" + k.keys(j.unescape).join("|") + ")", "g")};
    k.each(["escape", "unescape"], function (e) {
        k[e] = function (t) {
            return null == t ? "" : ("" + t).replace(A[e], function (t) {
                return j[e][t]
            })
        }
    }), k.result = function (e, t) {
        if (null == e)return void 0;
        var n = e[t];
        return k.isFunction(n) ? n.call(e) : n
    }, k.mixin = function (e) {
        T(k.functions(e), function (t) {
            var n = k[t] = e[t];
            k.prototype[t] = function () {
                var e = [this._wrapped];
                return a.apply(e, arguments), q.call(this, n.apply(k, e))
            }
        })
    };
    var L = 0;
    k.uniqueId = function (e) {
        var t = ++L + "";
        return e ? e + t : t
    }, k.templateSettings = {evaluate: /<%([\s\S]+?)%>/g, interpolate: /<%=([\s\S]+?)%>/g, escape: /<%-([\s\S]+?)%>/g};
    var H = /(.)^/, $ = {"'": "'", "\\": "\\", "\r": "r", "\n": "n", "	": "t", "\u2028": "u2028", "\u2029": "u2029"}, O = /\\|'|\r|\n|\t|\u2028|\u2029/g;
    k.template = function (e, t, n) {
        var i;
        n = k.defaults({}, n, k.templateSettings);
        var r = new RegExp([(n.escape || H).source, (n.interpolate || H).source, (n.evaluate || H).source].join("|") + "|$", "g"), o = 0, a = "__p+='";
        e.replace(r, function (t, n, i, r, s) {
            return a += e.slice(o, s).replace(O, function (e) {
                return"\\" + $[e]
            }), n && (a += "'+\n((__t=(" + n + "))==null?'':_.escape(__t))+\n'"), i && (a += "'+\n((__t=(" + i + "))==null?'':__t)+\n'"), r && (a += "';\n" + r + "\n__p+='"), o = s + t.length, t
        }), a += "';\n", n.variable || (a = "with(obj||{}){\n" + a + "}\n"), a = "var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};\n" + a + "return __p;\n";
        try {
            i = new Function(n.variable || "obj", "_", a)
        } catch (s) {
            throw s.source = a, s
        }
        if (t)return i(t, k);
        var l = function (e) {
            return i.call(this, e, k)
        };
        return l.source = "function(" + (n.variable || "obj") + "){\n" + a + "}", l
    }, k.chain = function (e) {
        return k(e).chain()
    };
    var q = function (e) {
        return this._chain ? k(e).chain() : e
    };
    k.mixin(k), T(["pop", "push", "reverse", "shift", "sort", "splice", "unshift"], function (e) {
        var t = i[e];
        k.prototype[e] = function () {
            var n = this._wrapped;
            return t.apply(n, arguments), "shift" != e && "splice" != e || 0 !== n.length || delete n[0], q.call(this, n)
        }
    }), T(["concat", "join", "slice"], function (e) {
        var t = i[e];
        k.prototype[e] = function () {
            return q.call(this, t.apply(this._wrapped, arguments))
        }
    }), k.extend(k.prototype, {chain: function () {
        return this._chain = !0, this
    }, value: function () {
        return this._wrapped
    }})
}.call(this), define("underscore", function (e) {
    return function () {
        var t;
        return t || e._
    }
}(this)), function (e, t) {
    function n(e) {
        var t = e.length, n = ct.type(e);
        return ct.isWindow(e) ? !1 : 1 === e.nodeType && t ? !0 : "array" === n || "function" !== n && (0 === t || "number" == typeof t && t > 0 && t - 1 in e)
    }

    function i(e) {
        var t = _t[e] = {};
        return ct.each(e.match(ht) || [], function (e, n) {
            t[n] = !0
        }), t
    }

    function r(e, n, i, r) {
        if (ct.acceptData(e)) {
            var o, a, s = ct.expando, l = e.nodeType, u = l ? ct.cache : e, c = l ? e[s] : e[s] && s;
            if (c && u[c] && (r || u[c].data) || i !== t || "string" != typeof n)return c || (c = l ? e[s] = tt.pop() || ct.guid++ : s), u[c] || (u[c] = l ? {} : {toJSON: ct.noop}), ("object" == typeof n || "function" == typeof n) && (r ? u[c] = ct.extend(u[c], n) : u[c].data = ct.extend(u[c].data, n)), a = u[c], r || (a.data || (a.data = {}), a = a.data), i !== t && (a[ct.camelCase(n)] = i), "string" == typeof n ? (o = a[n], null == o && (o = a[ct.camelCase(n)])) : o = a, o
        }
    }

    function o(e, t, n) {
        if (ct.acceptData(e)) {
            var i, r, o = e.nodeType, a = o ? ct.cache : e, l = o ? e[ct.expando] : ct.expando;
            if (a[l]) {
                if (t && (i = n ? a[l] : a[l].data)) {
                    ct.isArray(t) ? t = t.concat(ct.map(t, ct.camelCase)) : t in i ? t = [t] : (t = ct.camelCase(t), t = t in i ? [t] : t.split(" ")), r = t.length;
                    for (; r--;)delete i[t[r]];
                    if (n ? !s(i) : !ct.isEmptyObject(i))return
                }
                (n || (delete a[l].data, s(a[l]))) && (o ? ct.cleanData([e], !0) : ct.support.deleteExpando || a != a.window ? delete a[l] : a[l] = null)
            }
        }
    }

    function a(e, n, i) {
        if (i === t && 1 === e.nodeType) {
            var r = "data-" + n.replace(Dt, "-$1").toLowerCase();
            if (i = e.getAttribute(r), "string" == typeof i) {
                try {
                    i = "true" === i ? !0 : "false" === i ? !1 : "null" === i ? null : +i + "" === i ? +i : Ft.test(i) ? ct.parseJSON(i) : i
                } catch (o) {
                }
                ct.data(e, n, i)
            } else i = t
        }
        return i
    }

    function s(e) {
        var t;
        for (t in e)if (("data" !== t || !ct.isEmptyObject(e[t])) && "toJSON" !== t)return!1;
        return!0
    }

    function l() {
        return!0
    }

    function u() {
        return!1
    }

    function c() {
        try {
            return J.activeElement
        } catch (e) {
        }
    }

    function d(e, t) {
        do e = e[t]; while (e && 1 !== e.nodeType);
        return e
    }

    function h(e, t, n) {
        if (ct.isFunction(t))return ct.grep(e, function (e, i) {
            return!!t.call(e, i, e) !== n
        });
        if (t.nodeType)return ct.grep(e, function (e) {
            return e === t !== n
        });
        if ("string" == typeof t) {
            if (Yt.test(t))return ct.filter(t, e, n);
            t = ct.filter(t, e)
        }
        return ct.grep(e, function (e) {
            return ct.inArray(e, t) >= 0 !== n
        })
    }

    function f(e) {
        var t = Ut.split("|"), n = e.createDocumentFragment();
        if (n.createElement)for (; t.length;)n.createElement(t.pop());
        return n
    }

    function p(e, t) {
        return ct.nodeName(e, "table") && ct.nodeName(1 === t.nodeType ? t : t.firstChild, "tr") ? e.getElementsByTagName("tbody")[0] || e.appendChild(e.ownerDocument.createElement("tbody")) : e
    }

    function m(e) {
        return e.type = (null !== ct.find.attr(e, "type")) + "/" + e.type, e
    }

    function g(e) {
        var t = on.exec(e.type);
        return t ? e.type = t[1] : e.removeAttribute("type"), e
    }

    function v(e, t) {
        for (var n, i = 0; null != (n = e[i]); i++)ct._data(n, "globalEval", !t || ct._data(t[i], "globalEval"))
    }

    function y(e, t) {
        if (1 === t.nodeType && ct.hasData(e)) {
            var n, i, r, o = ct._data(e), a = ct._data(t, o), s = o.events;
            if (s) {
                delete a.handle, a.events = {};
                for (n in s)for (i = 0, r = s[n].length; r > i; i++)ct.event.add(t, n, s[n][i])
            }
            a.data && (a.data = ct.extend({}, a.data))
        }
    }

    function b(e, t) {
        var n, i, r;
        if (1 === t.nodeType) {
            if (n = t.nodeName.toLowerCase(), !ct.support.noCloneEvent && t[ct.expando]) {
                r = ct._data(t);
                for (i in r.events)ct.removeEvent(t, i, r.handle);
                t.removeAttribute(ct.expando)
            }
            "script" === n && t.text !== e.text ? (m(t).text = e.text, g(t)) : "object" === n ? (t.parentNode && (t.outerHTML = e.outerHTML), ct.support.html5Clone && e.innerHTML && !ct.trim(t.innerHTML) && (t.innerHTML = e.innerHTML)) : "input" === n && tn.test(e.type) ? (t.defaultChecked = t.checked = e.checked, t.value !== e.value && (t.value = e.value)) : "option" === n ? t.defaultSelected = t.selected = e.defaultSelected : ("input" === n || "textarea" === n) && (t.defaultValue = e.defaultValue)
        }
    }

    function w(e, n) {
        var i, r, o = 0, a = typeof e.getElementsByTagName !== V ? e.getElementsByTagName(n || "*") : typeof e.querySelectorAll !== V ? e.querySelectorAll(n || "*") : t;
        if (!a)for (a = [], i = e.childNodes || e; null != (r = i[o]); o++)!n || ct.nodeName(r, n) ? a.push(r) : ct.merge(a, w(r, n));
        return n === t || n && ct.nodeName(e, n) ? ct.merge([e], a) : a
    }

    function x(e) {
        tn.test(e.type) && (e.defaultChecked = e.checked)
    }

    function C(e, t) {
        if (t in e)return t;
        for (var n = t.charAt(0).toUpperCase() + t.slice(1), i = t, r = _n.length; r--;)if (t = _n[r] + n, t in e)return t;
        return i
    }

    function k(e, t) {
        return e = t || e, "none" === ct.css(e, "display") || !ct.contains(e.ownerDocument, e)
    }

    function T(e, t) {
        for (var n, i, r, o = [], a = 0, s = e.length; s > a; a++)i = e[a], i.style && (o[a] = ct._data(i, "olddisplay"), n = i.style.display, t ? (o[a] || "none" !== n || (i.style.display = ""), "" === i.style.display && k(i) && (o[a] = ct._data(i, "olddisplay", S(i.nodeName)))) : o[a] || (r = k(i), (n && "none" !== n || !r) && ct._data(i, "olddisplay", r ? n : ct.css(i, "display"))));
        for (a = 0; s > a; a++)i = e[a], i.style && (t && "none" !== i.style.display && "" !== i.style.display || (i.style.display = t ? o[a] || "" : "none"));
        return e
    }

    function _(e, t, n) {
        var i = yn.exec(t);
        return i ? Math.max(0, i[1] - (n || 0)) + (i[2] || "px") : t
    }

    function F(e, t, n, i, r) {
        for (var o = n === (i ? "border" : "content") ? 4 : "width" === t ? 1 : 0, a = 0; 4 > o; o += 2)"margin" === n && (a += ct.css(e, n + Tn[o], !0, r)), i ? ("content" === n && (a -= ct.css(e, "padding" + Tn[o], !0, r)), "margin" !== n && (a -= ct.css(e, "border" + Tn[o] + "Width", !0, r))) : (a += ct.css(e, "padding" + Tn[o], !0, r), "padding" !== n && (a += ct.css(e, "border" + Tn[o] + "Width", !0, r)));
        return a
    }

    function D(e, t, n) {
        var i = !0, r = "width" === t ? e.offsetWidth : e.offsetHeight, o = dn(e), a = ct.support.boxSizing && "border-box" === ct.css(e, "boxSizing", !1, o);
        if (0 >= r || null == r) {
            if (r = hn(e, t, o), (0 > r || null == r) && (r = e.style[t]), bn.test(r))return r;
            i = a && (ct.support.boxSizingReliable || r === e.style[t]), r = parseFloat(r) || 0
        }
        return r + F(e, t, n || (a ? "border" : "content"), i, o) + "px"
    }

    function S(e) {
        var t = J, n = xn[e];
        return n || (n = E(e, t), "none" !== n && n || (cn = (cn || ct("<iframe frameborder='0' width='0' height='0'/>").css("cssText", "display:block !important")).appendTo(t.documentElement), t = (cn[0].contentWindow || cn[0].contentDocument).document, t.write("<!doctype html><html><body>"), t.close(), n = E(e, t), cn.detach()), xn[e] = n), n
    }

    function E(e, t) {
        var n = ct(t.createElement(e)).appendTo(t.body), i = ct.css(n[0], "display");
        return n.remove(), i
    }

    function N(e, t, n, i) {
        var r;
        if (ct.isArray(t))ct.each(t, function (t, r) {
            n || Dn.test(e) ? i(e, r) : N(e + "[" + ("object" == typeof r ? t : "") + "]", r, n, i)
        }); else if (n || "object" !== ct.type(t))i(e, t); else for (r in t)N(e + "[" + r + "]", t[r], n, i)
    }

    function M(e) {
        return function (t, n) {
            "string" != typeof t && (n = t, t = "*");
            var i, r = 0, o = t.toLowerCase().match(ht) || [];
            if (ct.isFunction(n))for (; i = o[r++];)"+" === i[0] ? (i = i.slice(1) || "*", (e[i] = e[i] || []).unshift(n)) : (e[i] = e[i] || []).push(n)
        }
    }

    function j(e, n, i, r) {
        function o(l) {
            var u;
            return a[l] = !0, ct.each(e[l] || [], function (e, l) {
                var c = l(n, i, r);
                return"string" != typeof c || s || a[c] ? s ? !(u = c) : t : (n.dataTypes.unshift(c), o(c), !1)
            }), u
        }

        var a = {}, s = e === Gn;
        return o(n.dataTypes[0]) || !a["*"] && o("*")
    }

    function A(e, n) {
        var i, r, o = ct.ajaxSettings.flatOptions || {};
        for (r in n)n[r] !== t && ((o[r] ? e : i || (i = {}))[r] = n[r]);
        return i && ct.extend(!0, e, i), e
    }

    function L(e, n, i) {
        for (var r, o, a, s, l = e.contents, u = e.dataTypes; "*" === u[0];)u.shift(), o === t && (o = e.mimeType || n.getResponseHeader("Content-Type"));
        if (o)for (s in l)if (l[s] && l[s].test(o)) {
            u.unshift(s);
            break
        }
        if (u[0]in i)a = u[0]; else {
            for (s in i) {
                if (!u[0] || e.converters[s + " " + u[0]]) {
                    a = s;
                    break
                }
                r || (r = s)
            }
            a = a || r
        }
        return a ? (a !== u[0] && u.unshift(a), i[a]) : t
    }

    function H(e, t, n, i) {
        var r, o, a, s, l, u = {}, c = e.dataTypes.slice();
        if (c[1])for (a in e.converters)u[a.toLowerCase()] = e.converters[a];
        for (o = c.shift(); o;)if (e.responseFields[o] && (n[e.responseFields[o]] = t), !l && i && e.dataFilter && (t = e.dataFilter(t, e.dataType)), l = o, o = c.shift())if ("*" === o)o = l; else if ("*" !== l && l !== o) {
            if (a = u[l + " " + o] || u["* " + o], !a)for (r in u)if (s = r.split(" "), s[1] === o && (a = u[l + " " + s[0]] || u["* " + s[0]])) {
                a === !0 ? a = u[r] : u[r] !== !0 && (o = s[0], c.unshift(s[1]));
                break
            }
            if (a !== !0)if (a && e["throws"])t = a(t); else try {
                t = a(t)
            } catch (d) {
                return{state: "parsererror", error: a ? d : "No conversion from " + l + " to " + o}
            }
        }
        return{state: "success", data: t}
    }

    function $() {
        try {
            return new e.XMLHttpRequest
        } catch (t) {
        }
    }

    function O() {
        try {
            return new e.ActiveXObject("Microsoft.XMLHTTP")
        } catch (t) {
        }
    }

    function q() {
        return setTimeout(function () {
            Kn = t
        }), Kn = ct.now()
    }

    function z(e, t, n) {
        for (var i, r = (oi[t] || []).concat(oi["*"]), o = 0, a = r.length; a > o; o++)if (i = r[o].call(n, t, e))return i
    }

    function R(e, t, n) {
        var i, r, o = 0, a = ri.length, s = ct.Deferred().always(function () {
            delete l.elem
        }), l = function () {
            if (r)return!1;
            for (var t = Kn || q(), n = Math.max(0, u.startTime + u.duration - t), i = n / u.duration || 0, o = 1 - i, a = 0, l = u.tweens.length; l > a; a++)u.tweens[a].run(o);
            return s.notifyWith(e, [u, o, n]), 1 > o && l ? n : (s.resolveWith(e, [u]), !1)
        }, u = s.promise({elem: e, props: ct.extend({}, t), opts: ct.extend(!0, {specialEasing: {}}, n), originalProperties: t, originalOptions: n, startTime: Kn || q(), duration: n.duration, tweens: [], createTween: function (t, n) {
            var i = ct.Tween(e, u.opts, t, n, u.opts.specialEasing[t] || u.opts.easing);
            return u.tweens.push(i), i
        }, stop: function (t) {
            var n = 0, i = t ? u.tweens.length : 0;
            if (r)return this;
            for (r = !0; i > n; n++)u.tweens[n].run(1);
            return t ? s.resolveWith(e, [u, t]) : s.rejectWith(e, [u, t]), this
        }}), c = u.props;
        for (P(c, u.opts.specialEasing); a > o; o++)if (i = ri[o].call(u, e, c, u.opts))return i;
        return ct.map(c, z, u), ct.isFunction(u.opts.start) && u.opts.start.call(e, u), ct.fx.timer(ct.extend(l, {elem: e, anim: u, queue: u.opts.queue})), u.progress(u.opts.progress).done(u.opts.done, u.opts.complete).fail(u.opts.fail).always(u.opts.always)
    }

    function P(e, t) {
        var n, i, r, o, a;
        for (n in e)if (i = ct.camelCase(n), r = t[i], o = e[n], ct.isArray(o) && (r = o[1], o = e[n] = o[0]), n !== i && (e[i] = o, delete e[n]), a = ct.cssHooks[i], a && "expand"in a) {
            o = a.expand(o), delete e[i];
            for (n in o)n in e || (e[n] = o[n], t[n] = r)
        } else t[i] = r
    }

    function Y(e, t, n) {
        var i, r, o, a, s, l, u = this, c = {}, d = e.style, h = e.nodeType && k(e), f = ct._data(e, "fxshow");
        n.queue || (s = ct._queueHooks(e, "fx"), null == s.unqueued && (s.unqueued = 0, l = s.empty.fire, s.empty.fire = function () {
            s.unqueued || l()
        }), s.unqueued++, u.always(function () {
            u.always(function () {
                s.unqueued--, ct.queue(e, "fx").length || s.empty.fire()
            })
        })), 1 === e.nodeType && ("height"in t || "width"in t) && (n.overflow = [d.overflow, d.overflowX, d.overflowY], "inline" === ct.css(e, "display") && "none" === ct.css(e, "float") && (ct.support.inlineBlockNeedsLayout && "inline" !== S(e.nodeName) ? d.zoom = 1 : d.display = "inline-block")), n.overflow && (d.overflow = "hidden", ct.support.shrinkWrapBlocks || u.always(function () {
            d.overflow = n.overflow[0], d.overflowX = n.overflow[1], d.overflowY = n.overflow[2]
        }));
        for (i in t)if (r = t[i], ti.exec(r)) {
            if (delete t[i], o = o || "toggle" === r, r === (h ? "hide" : "show"))continue;
            c[i] = f && f[i] || ct.style(e, i)
        }
        if (!ct.isEmptyObject(c)) {
            f ? "hidden"in f && (h = f.hidden) : f = ct._data(e, "fxshow", {}), o && (f.hidden = !h), h ? ct(e).show() : u.done(function () {
                ct(e).hide()
            }), u.done(function () {
                var t;
                ct._removeData(e, "fxshow");
                for (t in c)ct.style(e, t, c[t])
            });
            for (i in c)a = z(h ? f[i] : 0, i, u), i in f || (f[i] = a.start, h && (a.end = a.start, a.start = "width" === i || "height" === i ? 1 : 0))
        }
    }

    function B(e, t, n, i, r) {
        return new B.prototype.init(e, t, n, i, r)
    }

    function G(e, t) {
        var n, i = {height: e}, r = 0;
        for (t = t ? 1 : 0; 4 > r; r += 2 - t)n = Tn[r], i["margin" + n] = i["padding" + n] = e;
        return t && (i.opacity = i.width = e), i
    }

    function W(e) {
        return ct.isWindow(e) ? e : 9 === e.nodeType ? e.defaultView || e.parentWindow : !1
    }

    var U, I, V = typeof t, X = e.location, J = e.document, Q = J.documentElement, Z = e.jQuery, K = e.$, et = {}, tt = [], nt = "1.10.2", it = tt.concat, rt = tt.push, ot = tt.slice, at = tt.indexOf, st = et.toString, lt = et.hasOwnProperty, ut = nt.trim, ct = function (e, t) {
        return new ct.fn.init(e, t, I)
    }, dt = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source, ht = /\S+/g, ft = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, pt = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/, mt = /^<(\w+)\s*\/?>(?:<\/\1>|)$/, gt = /^[\],:{}\s]*$/, vt = /(?:^|:|,)(?:\s*\[)+/g, yt = /\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g, bt = /"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g, wt = /^-ms-/, xt = /-([\da-z])/gi, Ct = function (e, t) {
        return t.toUpperCase()
    }, kt = function (e) {
        (J.addEventListener || "load" === e.type || "complete" === J.readyState) && (Tt(), ct.ready())
    }, Tt = function () {
        J.addEventListener ? (J.removeEventListener("DOMContentLoaded", kt, !1), e.removeEventListener("load", kt, !1)) : (J.detachEvent("onreadystatechange", kt), e.detachEvent("onload", kt))
    };
    ct.fn = ct.prototype = {jquery: nt, constructor: ct, init: function (e, n, i) {
        var r, o;
        if (!e)return this;
        if ("string" == typeof e) {
            if (r = "<" === e.charAt(0) && ">" === e.charAt(e.length - 1) && e.length >= 3 ? [null, e, null] : pt.exec(e), !r || !r[1] && n)return!n || n.jquery ? (n || i).find(e) : this.constructor(n).find(e);
            if (r[1]) {
                if (n = n instanceof ct ? n[0] : n, ct.merge(this, ct.parseHTML(r[1], n && n.nodeType ? n.ownerDocument || n : J, !0)), mt.test(r[1]) && ct.isPlainObject(n))for (r in n)ct.isFunction(this[r]) ? this[r](n[r]) : this.attr(r, n[r]);
                return this
            }
            if (o = J.getElementById(r[2]), o && o.parentNode) {
                if (o.id !== r[2])return i.find(e);
                this.length = 1, this[0] = o
            }
            return this.context = J, this.selector = e, this
        }
        return e.nodeType ? (this.context = this[0] = e, this.length = 1, this) : ct.isFunction(e) ? i.ready(e) : (e.selector !== t && (this.selector = e.selector, this.context = e.context), ct.makeArray(e, this))
    }, selector: "", length: 0, toArray: function () {
        return ot.call(this)
    }, get: function (e) {
        return null == e ? this.toArray() : 0 > e ? this[this.length + e] : this[e]
    }, pushStack: function (e) {
        var t = ct.merge(this.constructor(), e);
        return t.prevObject = this, t.context = this.context, t
    }, each: function (e, t) {
        return ct.each(this, e, t)
    }, ready: function (e) {
        return ct.ready.promise().done(e), this
    }, slice: function () {
        return this.pushStack(ot.apply(this, arguments))
    }, first: function () {
        return this.eq(0)
    }, last: function () {
        return this.eq(-1)
    }, eq: function (e) {
        var t = this.length, n = +e + (0 > e ? t : 0);
        return this.pushStack(n >= 0 && t > n ? [this[n]] : [])
    }, map: function (e) {
        return this.pushStack(ct.map(this, function (t, n) {
            return e.call(t, n, t)
        }))
    }, end: function () {
        return this.prevObject || this.constructor(null)
    }, push: rt, sort: [].sort, splice: [].splice}, ct.fn.init.prototype = ct.fn, ct.extend = ct.fn.extend = function () {
        var e, n, i, r, o, a, s = arguments[0] || {}, l = 1, u = arguments.length, c = !1;
        for ("boolean" == typeof s && (c = s, s = arguments[1] || {}, l = 2), "object" == typeof s || ct.isFunction(s) || (s = {}), u === l && (s = this, --l); u > l; l++)if (null != (o = arguments[l]))for (r in o)e = s[r], i = o[r], s !== i && (c && i && (ct.isPlainObject(i) || (n = ct.isArray(i))) ? (n ? (n = !1, a = e && ct.isArray(e) ? e : []) : a = e && ct.isPlainObject(e) ? e : {}, s[r] = ct.extend(c, a, i)) : i !== t && (s[r] = i));
        return s
    }, ct.extend({expando: "jQuery" + (nt + Math.random()).replace(/\D/g, ""), noConflict: function (t) {
        return e.$ === ct && (e.$ = K), t && e.jQuery === ct && (e.jQuery = Z), ct
    }, isReady: !1, readyWait: 1, holdReady: function (e) {
        e ? ct.readyWait++ : ct.ready(!0)
    }, ready: function (e) {
        if (e === !0 ? !--ct.readyWait : !ct.isReady) {
            if (!J.body)return setTimeout(ct.ready);
            ct.isReady = !0, e !== !0 && --ct.readyWait > 0 || (U.resolveWith(J, [ct]), ct.fn.trigger && ct(J).trigger("ready").off("ready"))
        }
    }, isFunction: function (e) {
        return"function" === ct.type(e)
    }, isArray: Array.isArray || function (e) {
        return"array" === ct.type(e)
    }, isWindow: function (e) {
        return null != e && e == e.window
    }, isNumeric: function (e) {
        return!isNaN(parseFloat(e)) && isFinite(e)
    }, type: function (e) {
        return null == e ? e + "" : "object" == typeof e || "function" == typeof e ? et[st.call(e)] || "object" : typeof e
    }, isPlainObject: function (e) {
        var n;
        if (!e || "object" !== ct.type(e) || e.nodeType || ct.isWindow(e))return!1;
        try {
            if (e.constructor && !lt.call(e, "constructor") && !lt.call(e.constructor.prototype, "isPrototypeOf"))return!1
        } catch (i) {
            return!1
        }
        if (ct.support.ownLast)for (n in e)return lt.call(e, n);
        for (n in e);
        return n === t || lt.call(e, n)
    }, isEmptyObject: function (e) {
        var t;
        for (t in e)return!1;
        return!0
    }, error: function (e) {
        throw Error(e)
    }, parseHTML: function (e, t, n) {
        if (!e || "string" != typeof e)return null;
        "boolean" == typeof t && (n = t, t = !1), t = t || J;
        var i = mt.exec(e), r = !n && [];
        return i ? [t.createElement(i[1])] : (i = ct.buildFragment([e], t, r), r && ct(r).remove(), ct.merge([], i.childNodes))
    }, parseJSON: function (n) {
        return e.JSON && e.JSON.parse ? e.JSON.parse(n) : null === n ? n : "string" == typeof n && (n = ct.trim(n), n && gt.test(n.replace(yt, "@").replace(bt, "]").replace(vt, ""))) ? Function("return " + n)() : (ct.error("Invalid JSON: " + n), t)
    }, parseXML: function (n) {
        var i, r;
        if (!n || "string" != typeof n)return null;
        try {
            e.DOMParser ? (r = new DOMParser, i = r.parseFromString(n, "text/xml")) : (i = new ActiveXObject("Microsoft.XMLDOM"), i.async = "false", i.loadXML(n))
        } catch (o) {
            i = t
        }
        return i && i.documentElement && !i.getElementsByTagName("parsererror").length || ct.error("Invalid XML: " + n), i
    }, noop: function () {
    }, globalEval: function (t) {
        t && ct.trim(t) && (e.execScript || function (t) {
            e.eval.call(e, t)
        })(t)
    }, camelCase: function (e) {
        return e.replace(wt, "ms-").replace(xt, Ct)
    }, nodeName: function (e, t) {
        return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
    }, each: function (e, t, i) {
        var r, o = 0, a = e.length, s = n(e);
        if (i) {
            if (s)for (; a > o && (r = t.apply(e[o], i), r !== !1); o++); else for (o in e)if (r = t.apply(e[o], i), r === !1)break
        } else if (s)for (; a > o && (r = t.call(e[o], o, e[o]), r !== !1); o++); else for (o in e)if (r = t.call(e[o], o, e[o]), r === !1)break;
        return e
    }, trim: ut && !ut.call("﻿ ") ? function (e) {
        return null == e ? "" : ut.call(e)
    } : function (e) {
        return null == e ? "" : (e + "").replace(ft, "")
    }, makeArray: function (e, t) {
        var i = t || [];
        return null != e && (n(Object(e)) ? ct.merge(i, "string" == typeof e ? [e] : e) : rt.call(i, e)), i
    }, inArray: function (e, t, n) {
        var i;
        if (t) {
            if (at)return at.call(t, e, n);
            for (i = t.length, n = n ? 0 > n ? Math.max(0, i + n) : n : 0; i > n; n++)if (n in t && t[n] === e)return n
        }
        return-1
    }, merge: function (e, n) {
        var i = n.length, r = e.length, o = 0;
        if ("number" == typeof i)for (; i > o; o++)e[r++] = n[o]; else for (; n[o] !== t;)e[r++] = n[o++];
        return e.length = r, e
    }, grep: function (e, t, n) {
        var i, r = [], o = 0, a = e.length;
        for (n = !!n; a > o; o++)i = !!t(e[o], o), n !== i && r.push(e[o]);
        return r
    }, map: function (e, t, i) {
        var r, o = 0, a = e.length, s = n(e), l = [];
        if (s)for (; a > o; o++)r = t(e[o], o, i), null != r && (l[l.length] = r); else for (o in e)r = t(e[o], o, i), null != r && (l[l.length] = r);
        return it.apply([], l)
    }, guid: 1, proxy: function (e, n) {
        var i, r, o;
        return"string" == typeof n && (o = e[n], n = e, e = o), ct.isFunction(e) ? (i = ot.call(arguments, 2), r = function () {
            return e.apply(n || this, i.concat(ot.call(arguments)))
        }, r.guid = e.guid = e.guid || ct.guid++, r) : t
    }, access: function (e, n, i, r, o, a, s) {
        var l = 0, u = e.length, c = null == i;
        if ("object" === ct.type(i)) {
            o = !0;
            for (l in i)ct.access(e, n, l, i[l], !0, a, s)
        } else if (r !== t && (o = !0, ct.isFunction(r) || (s = !0), c && (s ? (n.call(e, r), n = null) : (c = n, n = function (e, t, n) {
            return c.call(ct(e), n)
        })), n))for (; u > l; l++)n(e[l], i, s ? r : r.call(e[l], l, n(e[l], i)));
        return o ? e : c ? n.call(e) : u ? n(e[0], i) : a
    }, now: function () {
        return(new Date).getTime()
    }, swap: function (e, t, n, i) {
        var r, o, a = {};
        for (o in t)a[o] = e.style[o], e.style[o] = t[o];
        r = n.apply(e, i || []);
        for (o in t)e.style[o] = a[o];
        return r
    }}), ct.ready.promise = function (t) {
        if (!U)if (U = ct.Deferred(), "complete" === J.readyState)setTimeout(ct.ready); else if (J.addEventListener)J.addEventListener("DOMContentLoaded", kt, !1), e.addEventListener("load", kt, !1); else {
            J.attachEvent("onreadystatechange", kt), e.attachEvent("onload", kt);
            var n = !1;
            try {
                n = null == e.frameElement && J.documentElement
            } catch (i) {
            }
            n && n.doScroll && function r() {
                if (!ct.isReady) {
                    try {
                        n.doScroll("left")
                    } catch (e) {
                        return setTimeout(r, 50)
                    }
                    Tt(), ct.ready()
                }
            }()
        }
        return U.promise(t)
    }, ct.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function (e, t) {
        et["[object " + t + "]"] = t.toLowerCase()
    }), I = ct(J), function (e, t) {
        function n(e, t, n, i) {
            var r, o, a, s, l, u, c, d, p, m;
            if ((t ? t.ownerDocument || t : R) !== j && M(t), t = t || j, n = n || [], !e || "string" != typeof e)return n;
            if (1 !== (s = t.nodeType) && 9 !== s)return[];
            if (L && !i) {
                if (r = bt.exec(e))if (a = r[1]) {
                    if (9 === s) {
                        if (o = t.getElementById(a), !o || !o.parentNode)return n;
                        if (o.id === a)return n.push(o), n
                    } else if (t.ownerDocument && (o = t.ownerDocument.getElementById(a)) && q(t, o) && o.id === a)return n.push(o), n
                } else {
                    if (r[2])return et.apply(n, t.getElementsByTagName(e)), n;
                    if ((a = r[3]) && k.getElementsByClassName && t.getElementsByClassName)return et.apply(n, t.getElementsByClassName(a)), n
                }
                if (k.qsa && (!H || !H.test(e))) {
                    if (d = c = z, p = t, m = 9 === s && e, 1 === s && "object" !== t.nodeName.toLowerCase()) {
                        for (u = h(e), (c = t.getAttribute("id")) ? d = c.replace(Ct, "\\$&") : t.setAttribute("id", d), d = "[id='" + d + "'] ", l = u.length; l--;)u[l] = d + f(u[l]);
                        p = ft.test(e) && t.parentNode || t, m = u.join(",")
                    }
                    if (m)try {
                        return et.apply(n, p.querySelectorAll(m)), n
                    } catch (g) {
                    } finally {
                        c || t.removeAttribute("id")
                    }
                }
            }
            return x(e.replace(ut, "$1"), t, n, i)
        }

        function i() {
            function e(n, i) {
                return t.push(n += " ") > _.cacheLength && delete e[t.shift()], e[n] = i
            }

            var t = [];
            return e
        }

        function r(e) {
            return e[z] = !0, e
        }

        function o(e) {
            var t = j.createElement("div");
            try {
                return!!e(t)
            } catch (n) {
                return!1
            } finally {
                t.parentNode && t.parentNode.removeChild(t), t = null
            }
        }

        function a(e, t) {
            for (var n = e.split("|"), i = e.length; i--;)_.attrHandle[n[i]] = t
        }

        function s(e, t) {
            var n = t && e, i = n && 1 === e.nodeType && 1 === t.nodeType && (~t.sourceIndex || X) - (~e.sourceIndex || X);
            if (i)return i;
            if (n)for (; n = n.nextSibling;)if (n === t)return-1;
            return e ? 1 : -1
        }

        function l(e) {
            return function (t) {
                var n = t.nodeName.toLowerCase();
                return"input" === n && t.type === e
            }
        }

        function u(e) {
            return function (t) {
                var n = t.nodeName.toLowerCase();
                return("input" === n || "button" === n) && t.type === e
            }
        }

        function c(e) {
            return r(function (t) {
                return t = +t, r(function (n, i) {
                    for (var r, o = e([], n.length, t), a = o.length; a--;)n[r = o[a]] && (n[r] = !(i[r] = n[r]))
                })
            })
        }

        function d() {
        }

        function h(e, t) {
            var i, r, o, a, s, l, u, c = G[e + " "];
            if (c)return t ? 0 : c.slice(0);
            for (s = e, l = [], u = _.preFilter; s;) {
                (!i || (r = dt.exec(s))) && (r && (s = s.slice(r[0].length) || s), l.push(o = [])), i = !1, (r = ht.exec(s)) && (i = r.shift(), o.push({value: i, type: r[0].replace(ut, " ")}), s = s.slice(i.length));
                for (a in _.filter)!(r = vt[a].exec(s)) || u[a] && !(r = u[a](r)) || (i = r.shift(), o.push({value: i, type: a, matches: r}), s = s.slice(i.length));
                if (!i)break
            }
            return t ? s.length : s ? n.error(e) : G(e, l).slice(0)
        }

        function f(e) {
            for (var t = 0, n = e.length, i = ""; n > t; t++)i += e[t].value;
            return i
        }

        function p(e, t, n) {
            var i = t.dir, r = n && "parentNode" === i, o = Y++;
            return t.first ? function (t, n, o) {
                for (; t = t[i];)if (1 === t.nodeType || r)return e(t, n, o)
            } : function (t, n, a) {
                var s, l, u, c = P + " " + o;
                if (a) {
                    for (; t = t[i];)if ((1 === t.nodeType || r) && e(t, n, a))return!0
                } else for (; t = t[i];)if (1 === t.nodeType || r)if (u = t[z] || (t[z] = {}), (l = u[i]) && l[0] === c) {
                    if ((s = l[1]) === !0 || s === T)return s === !0
                } else if (l = u[i] = [c], l[1] = e(t, n, a) || T, l[1] === !0)return!0
            }
        }

        function m(e) {
            return e.length > 1 ? function (t, n, i) {
                for (var r = e.length; r--;)if (!e[r](t, n, i))return!1;
                return!0
            } : e[0]
        }

        function g(e, t, n, i, r) {
            for (var o, a = [], s = 0, l = e.length, u = null != t; l > s; s++)(o = e[s]) && (!n || n(o, i, r)) && (a.push(o), u && t.push(s));
            return a
        }

        function v(e, t, n, i, o, a) {
            return i && !i[z] && (i = v(i)), o && !o[z] && (o = v(o, a)), r(function (r, a, s, l) {
                var u, c, d, h = [], f = [], p = a.length, m = r || w(t || "*", s.nodeType ? [s] : s, []), v = !e || !r && t ? m : g(m, h, e, s, l), y = n ? o || (r ? e : p || i) ? [] : a : v;
                if (n && n(v, y, s, l), i)for (u = g(y, f), i(u, [], s, l), c = u.length; c--;)(d = u[c]) && (y[f[c]] = !(v[f[c]] = d));
                if (r) {
                    if (o || e) {
                        if (o) {
                            for (u = [], c = y.length; c--;)(d = y[c]) && u.push(v[c] = d);
                            o(null, y = [], u, l)
                        }
                        for (c = y.length; c--;)(d = y[c]) && (u = o ? nt.call(r, d) : h[c]) > -1 && (r[u] = !(a[u] = d))
                    }
                } else y = g(y === a ? y.splice(p, y.length) : y), o ? o(null, a, y, l) : et.apply(a, y)
            })
        }

        function y(e) {
            for (var t, n, i, r = e.length, o = _.relative[e[0].type], a = o || _.relative[" "], s = o ? 1 : 0, l = p(function (e) {
                return e === t
            }, a, !0), u = p(function (e) {
                return nt.call(t, e) > -1
            }, a, !0), c = [function (e, n, i) {
                return!o && (i || n !== E) || ((t = n).nodeType ? l(e, n, i) : u(e, n, i))
            }]; r > s; s++)if (n = _.relative[e[s].type])c = [p(m(c), n)]; else {
                if (n = _.filter[e[s].type].apply(null, e[s].matches), n[z]) {
                    for (i = ++s; r > i && !_.relative[e[i].type]; i++);
                    return v(s > 1 && m(c), s > 1 && f(e.slice(0, s - 1).concat({value: " " === e[s - 2].type ? "*" : ""})).replace(ut, "$1"), n, i > s && y(e.slice(s, i)), r > i && y(e = e.slice(i)), r > i && f(e))
                }
                c.push(n)
            }
            return m(c)
        }

        function b(e, t) {
            var i = 0, o = t.length > 0, a = e.length > 0, s = function (r, s, l, u, c) {
                var d, h, f, p = [], m = 0, v = "0", y = r && [], b = null != c, w = E, x = r || a && _.find.TAG("*", c && s.parentNode || s), C = P += null == w ? 1 : Math.random() || .1;
                for (b && (E = s !== j && s, T = i); null != (d = x[v]); v++) {
                    if (a && d) {
                        for (h = 0; f = e[h++];)if (f(d, s, l)) {
                            u.push(d);
                            break
                        }
                        b && (P = C, T = ++i)
                    }
                    o && ((d = !f && d) && m--, r && y.push(d))
                }
                if (m += v, o && v !== m) {
                    for (h = 0; f = t[h++];)f(y, p, s, l);
                    if (r) {
                        if (m > 0)for (; v--;)y[v] || p[v] || (p[v] = Z.call(u));
                        p = g(p)
                    }
                    et.apply(u, p), b && !r && p.length > 0 && m + t.length > 1 && n.uniqueSort(u)
                }
                return b && (P = C, E = w), y
            };
            return o ? r(s) : s
        }

        function w(e, t, i) {
            for (var r = 0, o = t.length; o > r; r++)n(e, t[r], i);
            return i
        }

        function x(e, t, n, i) {
            var r, o, a, s, l, u = h(e);
            if (!i && 1 === u.length) {
                if (o = u[0] = u[0].slice(0), o.length > 2 && "ID" === (a = o[0]).type && k.getById && 9 === t.nodeType && L && _.relative[o[1].type]) {
                    if (t = (_.find.ID(a.matches[0].replace(kt, Tt), t) || [])[0], !t)return n;
                    e = e.slice(o.shift().value.length)
                }
                for (r = vt.needsContext.test(e) ? 0 : o.length; r-- && (a = o[r], !_.relative[s = a.type]);)if ((l = _.find[s]) && (i = l(a.matches[0].replace(kt, Tt), ft.test(o[0].type) && t.parentNode || t))) {
                    if (o.splice(r, 1), e = i.length && f(o), !e)return et.apply(n, i), n;
                    break
                }
            }
            return S(e, u)(i, t, !L, n, ft.test(e)), n
        }

        var C, k, T, _, F, D, S, E, N, M, j, A, L, H, $, O, q, z = "sizzle" + -new Date, R = e.document, P = 0, Y = 0, B = i(), G = i(), W = i(), U = !1, I = function (e, t) {
            return e === t ? (U = !0, 0) : 0
        }, V = typeof t, X = 1 << 31, J = {}.hasOwnProperty, Q = [], Z = Q.pop, K = Q.push, et = Q.push, tt = Q.slice, nt = Q.indexOf || function (e) {
            for (var t = 0, n = this.length; n > t; t++)if (this[t] === e)return t;
            return-1
        }, it = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", rt = "[\\x20\\t\\r\\n\\f]", ot = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+", at = ot.replace("w", "w#"), st = "\\[" + rt + "*(" + ot + ")" + rt + "*(?:([*^$|!~]?=)" + rt + "*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" + at + ")|)|)" + rt + "*\\]", lt = ":(" + ot + ")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|" + st.replace(3, 8) + ")*)|.*)\\)|)", ut = RegExp("^" + rt + "+|((?:^|[^\\\\])(?:\\\\.)*)" + rt + "+$", "g"), dt = RegExp("^" + rt + "*," + rt + "*"), ht = RegExp("^" + rt + "*([>+~]|" + rt + ")" + rt + "*"), ft = RegExp(rt + "*[+~]"), pt = RegExp("=" + rt + "*([^\\]'\"]*)" + rt + "*\\]", "g"), mt = RegExp(lt), gt = RegExp("^" + at + "$"), vt = {ID: RegExp("^#(" + ot + ")"), CLASS: RegExp("^\\.(" + ot + ")"), TAG: RegExp("^(" + ot.replace("w", "w*") + ")"), ATTR: RegExp("^" + st), PSEUDO: RegExp("^" + lt), CHILD: RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + rt + "*(even|odd|(([+-]|)(\\d*)n|)" + rt + "*(?:([+-]|)" + rt + "*(\\d+)|))" + rt + "*\\)|)", "i"), bool: RegExp("^(?:" + it + ")$", "i"), needsContext: RegExp("^" + rt + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + rt + "*((?:-\\d)?\\d*)" + rt + "*\\)|)(?=[^-]|$)", "i")}, yt = /^[^{]+\{\s*\[native \w/, bt = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, wt = /^(?:input|select|textarea|button)$/i, xt = /^h\d$/i, Ct = /'|\\/g, kt = RegExp("\\\\([\\da-f]{1,6}" + rt + "?|(" + rt + ")|.)", "ig"), Tt = function (e, t, n) {
            var i = "0x" + t - 65536;
            return i !== i || n ? t : 0 > i ? String.fromCharCode(i + 65536) : String.fromCharCode(55296 | i >> 10, 56320 | 1023 & i)
        };
        try {
            et.apply(Q = tt.call(R.childNodes), R.childNodes), Q[R.childNodes.length].nodeType
        } catch (_t) {
            et = {apply: Q.length ? function (e, t) {
                K.apply(e, tt.call(t))
            } : function (e, t) {
                for (var n = e.length, i = 0; e[n++] = t[i++];);
                e.length = n - 1
            }}
        }
        D = n.isXML = function (e) {
            var t = e && (e.ownerDocument || e).documentElement;
            return t ? "HTML" !== t.nodeName : !1
        }, k = n.support = {}, M = n.setDocument = function (e) {
            var n = e ? e.ownerDocument || e : R, i = n.defaultView;
            return n !== j && 9 === n.nodeType && n.documentElement ? (j = n, A = n.documentElement, L = !D(n), i && i.attachEvent && i !== i.top && i.attachEvent("onbeforeunload", function () {
                M()
            }), k.attributes = o(function (e) {
                return e.className = "i", !e.getAttribute("className")
            }), k.getElementsByTagName = o(function (e) {
                return e.appendChild(n.createComment("")), !e.getElementsByTagName("*").length
            }), k.getElementsByClassName = o(function (e) {
                return e.innerHTML = "<div class='a'></div><div class='a i'></div>", e.firstChild.className = "i", 2 === e.getElementsByClassName("i").length
            }), k.getById = o(function (e) {
                return A.appendChild(e).id = z, !n.getElementsByName || !n.getElementsByName(z).length
            }), k.getById ? (_.find.ID = function (e, t) {
                if (typeof t.getElementById !== V && L) {
                    var n = t.getElementById(e);
                    return n && n.parentNode ? [n] : []
                }
            }, _.filter.ID = function (e) {
                var t = e.replace(kt, Tt);
                return function (e) {
                    return e.getAttribute("id") === t
                }
            }) : (delete _.find.ID, _.filter.ID = function (e) {
                var t = e.replace(kt, Tt);
                return function (e) {
                    var n = typeof e.getAttributeNode !== V && e.getAttributeNode("id");
                    return n && n.value === t
                }
            }), _.find.TAG = k.getElementsByTagName ? function (e, n) {
                return typeof n.getElementsByTagName !== V ? n.getElementsByTagName(e) : t
            } : function (e, t) {
                var n, i = [], r = 0, o = t.getElementsByTagName(e);
                if ("*" === e) {
                    for (; n = o[r++];)1 === n.nodeType && i.push(n);
                    return i
                }
                return o
            }, _.find.CLASS = k.getElementsByClassName && function (e, n) {
                return typeof n.getElementsByClassName !== V && L ? n.getElementsByClassName(e) : t
            }, $ = [], H = [], (k.qsa = yt.test(n.querySelectorAll)) && (o(function (e) {
                e.innerHTML = "<select><option selected=''></option></select>", e.querySelectorAll("[selected]").length || H.push("\\[" + rt + "*(?:value|" + it + ")"), e.querySelectorAll(":checked").length || H.push(":checked")
            }), o(function (e) {
                var t = n.createElement("input");
                t.setAttribute("type", "hidden"), e.appendChild(t).setAttribute("t", ""), e.querySelectorAll("[t^='']").length && H.push("[*^$]=" + rt + "*(?:''|\"\")"), e.querySelectorAll(":enabled").length || H.push(":enabled", ":disabled"), e.querySelectorAll("*,:x"), H.push(",.*:")
            })), (k.matchesSelector = yt.test(O = A.webkitMatchesSelector || A.mozMatchesSelector || A.oMatchesSelector || A.msMatchesSelector)) && o(function (e) {
                k.disconnectedMatch = O.call(e, "div"), O.call(e, "[s!='']:x"), $.push("!=", lt)
            }), H = H.length && RegExp(H.join("|")), $ = $.length && RegExp($.join("|")), q = yt.test(A.contains) || A.compareDocumentPosition ? function (e, t) {
                var n = 9 === e.nodeType ? e.documentElement : e, i = t && t.parentNode;
                return e === i || !(!i || 1 !== i.nodeType || !(n.contains ? n.contains(i) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(i)))
            } : function (e, t) {
                if (t)for (; t = t.parentNode;)if (t === e)return!0;
                return!1
            }, I = A.compareDocumentPosition ? function (e, t) {
                if (e === t)return U = !0, 0;
                var i = t.compareDocumentPosition && e.compareDocumentPosition && e.compareDocumentPosition(t);
                return i ? 1 & i || !k.sortDetached && t.compareDocumentPosition(e) === i ? e === n || q(R, e) ? -1 : t === n || q(R, t) ? 1 : N ? nt.call(N, e) - nt.call(N, t) : 0 : 4 & i ? -1 : 1 : e.compareDocumentPosition ? -1 : 1
            } : function (e, t) {
                var i, r = 0, o = e.parentNode, a = t.parentNode, l = [e], u = [t];
                if (e === t)return U = !0, 0;
                if (!o || !a)return e === n ? -1 : t === n ? 1 : o ? -1 : a ? 1 : N ? nt.call(N, e) - nt.call(N, t) : 0;
                if (o === a)return s(e, t);
                for (i = e; i = i.parentNode;)l.unshift(i);
                for (i = t; i = i.parentNode;)u.unshift(i);
                for (; l[r] === u[r];)r++;
                return r ? s(l[r], u[r]) : l[r] === R ? -1 : u[r] === R ? 1 : 0
            }, n) : j
        }, n.matches = function (e, t) {
            return n(e, null, null, t)
        }, n.matchesSelector = function (e, t) {
            if ((e.ownerDocument || e) !== j && M(e), t = t.replace(pt, "='$1']"), !(!k.matchesSelector || !L || $ && $.test(t) || H && H.test(t)))try {
                var i = O.call(e, t);
                if (i || k.disconnectedMatch || e.document && 11 !== e.document.nodeType)return i
            } catch (r) {
            }
            return n(t, j, null, [e]).length > 0
        }, n.contains = function (e, t) {
            return(e.ownerDocument || e) !== j && M(e), q(e, t)
        }, n.attr = function (e, n) {
            (e.ownerDocument || e) !== j && M(e);
            var i = _.attrHandle[n.toLowerCase()], r = i && J.call(_.attrHandle, n.toLowerCase()) ? i(e, n, !L) : t;
            return r === t ? k.attributes || !L ? e.getAttribute(n) : (r = e.getAttributeNode(n)) && r.specified ? r.value : null : r
        }, n.error = function (e) {
            throw Error("Syntax error, unrecognized expression: " + e)
        }, n.uniqueSort = function (e) {
            var t, n = [], i = 0, r = 0;
            if (U = !k.detectDuplicates, N = !k.sortStable && e.slice(0), e.sort(I), U) {
                for (; t = e[r++];)t === e[r] && (i = n.push(r));
                for (; i--;)e.splice(n[i], 1)
            }
            return e
        }, F = n.getText = function (e) {
            var t, n = "", i = 0, r = e.nodeType;
            if (r) {
                if (1 === r || 9 === r || 11 === r) {
                    if ("string" == typeof e.textContent)return e.textContent;
                    for (e = e.firstChild; e; e = e.nextSibling)n += F(e)
                } else if (3 === r || 4 === r)return e.nodeValue
            } else for (; t = e[i]; i++)n += F(t);
            return n
        }, _ = n.selectors = {cacheLength: 50, createPseudo: r, match: vt, attrHandle: {}, find: {}, relative: {">": {dir: "parentNode", first: !0}, " ": {dir: "parentNode"}, "+": {dir: "previousSibling", first: !0}, "~": {dir: "previousSibling"}}, preFilter: {ATTR: function (e) {
            return e[1] = e[1].replace(kt, Tt), e[3] = (e[4] || e[5] || "").replace(kt, Tt), "~=" === e[2] && (e[3] = " " + e[3] + " "), e.slice(0, 4)
        }, CHILD: function (e) {
            return e[1] = e[1].toLowerCase(), "nth" === e[1].slice(0, 3) ? (e[3] || n.error(e[0]), e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])), e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && n.error(e[0]), e
        }, PSEUDO: function (e) {
            var n, i = !e[5] && e[2];
            return vt.CHILD.test(e[0]) ? null : (e[3] && e[4] !== t ? e[2] = e[4] : i && mt.test(i) && (n = h(i, !0)) && (n = i.indexOf(")", i.length - n) - i.length) && (e[0] = e[0].slice(0, n), e[2] = i.slice(0, n)), e.slice(0, 3))
        }}, filter: {TAG: function (e) {
            var t = e.replace(kt, Tt).toLowerCase();
            return"*" === e ? function () {
                return!0
            } : function (e) {
                return e.nodeName && e.nodeName.toLowerCase() === t
            }
        }, CLASS: function (e) {
            var t = B[e + " "];
            return t || (t = RegExp("(^|" + rt + ")" + e + "(" + rt + "|$)")) && B(e, function (e) {
                return t.test("string" == typeof e.className && e.className || typeof e.getAttribute !== V && e.getAttribute("class") || "")
            })
        }, ATTR: function (e, t, i) {
            return function (r) {
                var o = n.attr(r, e);
                return null == o ? "!=" === t : t ? (o += "", "=" === t ? o === i : "!=" === t ? o !== i : "^=" === t ? i && 0 === o.indexOf(i) : "*=" === t ? i && o.indexOf(i) > -1 : "$=" === t ? i && o.slice(-i.length) === i : "~=" === t ? (" " + o + " ").indexOf(i) > -1 : "|=" === t ? o === i || o.slice(0, i.length + 1) === i + "-" : !1) : !0
            }
        }, CHILD: function (e, t, n, i, r) {
            var o = "nth" !== e.slice(0, 3), a = "last" !== e.slice(-4), s = "of-type" === t;
            return 1 === i && 0 === r ? function (e) {
                return!!e.parentNode
            } : function (t, n, l) {
                var u, c, d, h, f, p, m = o !== a ? "nextSibling" : "previousSibling", g = t.parentNode, v = s && t.nodeName.toLowerCase(), y = !l && !s;
                if (g) {
                    if (o) {
                        for (; m;) {
                            for (d = t; d = d[m];)if (s ? d.nodeName.toLowerCase() === v : 1 === d.nodeType)return!1;
                            p = m = "only" === e && !p && "nextSibling"
                        }
                        return!0
                    }
                    if (p = [a ? g.firstChild : g.lastChild], a && y) {
                        for (c = g[z] || (g[z] = {}), u = c[e] || [], f = u[0] === P && u[1], h = u[0] === P && u[2], d = f && g.childNodes[f]; d = ++f && d && d[m] || (h = f = 0) || p.pop();)if (1 === d.nodeType && ++h && d === t) {
                            c[e] = [P, f, h];
                            break
                        }
                    } else if (y && (u = (t[z] || (t[z] = {}))[e]) && u[0] === P)h = u[1]; else for (; (d = ++f && d && d[m] || (h = f = 0) || p.pop()) && ((s ? d.nodeName.toLowerCase() !== v : 1 !== d.nodeType) || !++h || (y && ((d[z] || (d[z] = {}))[e] = [P, h]), d !== t)););
                    return h -= r, h === i || 0 === h % i && h / i >= 0
                }
            }
        }, PSEUDO: function (e, t) {
            var i, o = _.pseudos[e] || _.setFilters[e.toLowerCase()] || n.error("unsupported pseudo: " + e);
            return o[z] ? o(t) : o.length > 1 ? (i = [e, e, "", t], _.setFilters.hasOwnProperty(e.toLowerCase()) ? r(function (e, n) {
                for (var i, r = o(e, t), a = r.length; a--;)i = nt.call(e, r[a]), e[i] = !(n[i] = r[a])
            }) : function (e) {
                return o(e, 0, i)
            }) : o
        }}, pseudos: {not: r(function (e) {
            var t = [], n = [], i = S(e.replace(ut, "$1"));
            return i[z] ? r(function (e, t, n, r) {
                for (var o, a = i(e, null, r, []), s = e.length; s--;)(o = a[s]) && (e[s] = !(t[s] = o))
            }) : function (e, r, o) {
                return t[0] = e, i(t, null, o, n), !n.pop()
            }
        }), has: r(function (e) {
            return function (t) {
                return n(e, t).length > 0
            }
        }), contains: r(function (e) {
            return function (t) {
                return(t.textContent || t.innerText || F(t)).indexOf(e) > -1
            }
        }), lang: r(function (e) {
            return gt.test(e || "") || n.error("unsupported lang: " + e), e = e.replace(kt, Tt).toLowerCase(), function (t) {
                var n;
                do if (n = L ? t.lang : t.getAttribute("xml:lang") || t.getAttribute("lang"))return n = n.toLowerCase(), n === e || 0 === n.indexOf(e + "-"); while ((t = t.parentNode) && 1 === t.nodeType);
                return!1
            }
        }), target: function (t) {
            var n = e.location && e.location.hash;
            return n && n.slice(1) === t.id
        }, root: function (e) {
            return e === A
        }, focus: function (e) {
            return e === j.activeElement && (!j.hasFocus || j.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
        }, enabled: function (e) {
            return e.disabled === !1
        }, disabled: function (e) {
            return e.disabled === !0
        }, checked: function (e) {
            var t = e.nodeName.toLowerCase();
            return"input" === t && !!e.checked || "option" === t && !!e.selected
        }, selected: function (e) {
            return e.parentNode && e.parentNode.selectedIndex, e.selected === !0
        }, empty: function (e) {
            for (e = e.firstChild; e; e = e.nextSibling)if (e.nodeName > "@" || 3 === e.nodeType || 4 === e.nodeType)return!1;
            return!0
        }, parent: function (e) {
            return!_.pseudos.empty(e)
        }, header: function (e) {
            return xt.test(e.nodeName)
        }, input: function (e) {
            return wt.test(e.nodeName)
        }, button: function (e) {
            var t = e.nodeName.toLowerCase();
            return"input" === t && "button" === e.type || "button" === t
        }, text: function (e) {
            var t;
            return"input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || t.toLowerCase() === e.type)
        }, first: c(function () {
            return[0]
        }), last: c(function (e, t) {
            return[t - 1]
        }), eq: c(function (e, t, n) {
            return[0 > n ? n + t : n]
        }), even: c(function (e, t) {
            for (var n = 0; t > n; n += 2)e.push(n);
            return e
        }), odd: c(function (e, t) {
            for (var n = 1; t > n; n += 2)e.push(n);
            return e
        }), lt: c(function (e, t, n) {
            for (var i = 0 > n ? n + t : n; --i >= 0;)e.push(i);
            return e
        }), gt: c(function (e, t, n) {
            for (var i = 0 > n ? n + t : n; t > ++i;)e.push(i);
            return e
        })}}, _.pseudos.nth = _.pseudos.eq;
        for (C in{radio: !0, checkbox: !0, file: !0, password: !0, image: !0})_.pseudos[C] = l(C);
        for (C in{submit: !0, reset: !0})_.pseudos[C] = u(C);
        d.prototype = _.filters = _.pseudos, _.setFilters = new d, S = n.compile = function (e, t) {
            var n, i = [], r = [], o = W[e + " "];
            if (!o) {
                for (t || (t = h(e)), n = t.length; n--;)o = y(t[n]), o[z] ? i.push(o) : r.push(o);
                o = W(e, b(r, i))
            }
            return o
        }, k.sortStable = z.split("").sort(I).join("") === z, k.detectDuplicates = U, M(), k.sortDetached = o(function (e) {
            return 1 & e.compareDocumentPosition(j.createElement("div"))
        }), o(function (e) {
            return e.innerHTML = "<a href='#'></a>", "#" === e.firstChild.getAttribute("href")
        }) || a("type|href|height|width", function (e, n, i) {
            return i ? t : e.getAttribute(n, "type" === n.toLowerCase() ? 1 : 2)
        }), k.attributes && o(function (e) {
            return e.innerHTML = "<input/>", e.firstChild.setAttribute("value", ""), "" === e.firstChild.getAttribute("value")
        }) || a("value", function (e, n, i) {
            return i || "input" !== e.nodeName.toLowerCase() ? t : e.defaultValue
        }), o(function (e) {
            return null == e.getAttribute("disabled")
        }) || a(it, function (e, n, i) {
            var r;
            return i ? t : (r = e.getAttributeNode(n)) && r.specified ? r.value : e[n] === !0 ? n.toLowerCase() : null
        }), ct.find = n, ct.expr = n.selectors, ct.expr[":"] = ct.expr.pseudos, ct.unique = n.uniqueSort, ct.text = n.getText, ct.isXMLDoc = n.isXML, ct.contains = n.contains
    }(e);
    var _t = {};
    ct.Callbacks = function (e) {
        e = "string" == typeof e ? _t[e] || i(e) : ct.extend({}, e);
        var n, r, o, a, s, l, u = [], c = !e.once && [], d = function (t) {
            for (r = e.memory && t, o = !0, s = l || 0, l = 0, a = u.length, n = !0; u && a > s; s++)if (u[s].apply(t[0], t[1]) === !1 && e.stopOnFalse) {
                r = !1;
                break
            }
            n = !1, u && (c ? c.length && d(c.shift()) : r ? u = [] : h.disable())
        }, h = {add: function () {
            if (u) {
                var t = u.length;
                !function i(t) {
                    ct.each(t, function (t, n) {
                        var r = ct.type(n);
                        "function" === r ? e.unique && h.has(n) || u.push(n) : n && n.length && "string" !== r && i(n)
                    })
                }(arguments), n ? a = u.length : r && (l = t, d(r))
            }
            return this
        }, remove: function () {
            return u && ct.each(arguments, function (e, t) {
                for (var i; (i = ct.inArray(t, u, i)) > -1;)u.splice(i, 1), n && (a >= i && a--, s >= i && s--)
            }), this
        }, has: function (e) {
            return e ? ct.inArray(e, u) > -1 : !(!u || !u.length)
        }, empty: function () {
            return u = [], a = 0, this
        }, disable: function () {
            return u = c = r = t, this
        }, disabled: function () {
            return!u
        }, lock: function () {
            return c = t, r || h.disable(), this
        }, locked: function () {
            return!c
        }, fireWith: function (e, t) {
            return!u || o && !c || (t = t || [], t = [e, t.slice ? t.slice() : t], n ? c.push(t) : d(t)), this
        }, fire: function () {
            return h.fireWith(this, arguments), this
        }, fired: function () {
            return!!o
        }};
        return h
    }, ct.extend({Deferred: function (e) {
        var t = [
            ["resolve", "done", ct.Callbacks("once memory"), "resolved"],
            ["reject", "fail", ct.Callbacks("once memory"), "rejected"],
            ["notify", "progress", ct.Callbacks("memory")]
        ], n = "pending", i = {state: function () {
            return n
        }, always: function () {
            return r.done(arguments).fail(arguments), this
        }, then: function () {
            var e = arguments;
            return ct.Deferred(function (n) {
                ct.each(t, function (t, o) {
                    var a = o[0], s = ct.isFunction(e[t]) && e[t];
                    r[o[1]](function () {
                        var e = s && s.apply(this, arguments);
                        e && ct.isFunction(e.promise) ? e.promise().done(n.resolve).fail(n.reject).progress(n.notify) : n[a + "With"](this === i ? n.promise() : this, s ? [e] : arguments)
                    })
                }), e = null
            }).promise()
        }, promise: function (e) {
            return null != e ? ct.extend(e, i) : i
        }}, r = {};
        return i.pipe = i.then, ct.each(t, function (e, o) {
            var a = o[2], s = o[3];
            i[o[1]] = a.add, s && a.add(function () {
                n = s
            }, t[1 ^ e][2].disable, t[2][2].lock), r[o[0]] = function () {
                return r[o[0] + "With"](this === r ? i : this, arguments), this
            }, r[o[0] + "With"] = a.fireWith
        }), i.promise(r), e && e.call(r, r), r
    }, when: function (e) {
        var t, n, i, r = 0, o = ot.call(arguments), a = o.length, s = 1 !== a || e && ct.isFunction(e.promise) ? a : 0, l = 1 === s ? e : ct.Deferred(), u = function (e, n, i) {
            return function (r) {
                n[e] = this, i[e] = arguments.length > 1 ? ot.call(arguments) : r, i === t ? l.notifyWith(n, i) : --s || l.resolveWith(n, i)
            }
        };
        if (a > 1)for (t = Array(a), n = Array(a), i = Array(a); a > r; r++)o[r] && ct.isFunction(o[r].promise) ? o[r].promise().done(u(r, i, o)).fail(l.reject).progress(u(r, n, t)) : --s;
        return s || l.resolveWith(i, o), l.promise()
    }}), ct.support = function (t) {
        var n, i, r, o, a, s, l, u, c, d = J.createElement("div");
        if (d.setAttribute("className", "t"), d.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", n = d.getElementsByTagName("*") || [], i = d.getElementsByTagName("a")[0], !i || !i.style || !n.length)return t;
        o = J.createElement("select"), s = o.appendChild(J.createElement("option")), r = d.getElementsByTagName("input")[0], i.style.cssText = "top:1px;float:left;opacity:.5", t.getSetAttribute = "t" !== d.className, t.leadingWhitespace = 3 === d.firstChild.nodeType, t.tbody = !d.getElementsByTagName("tbody").length, t.htmlSerialize = !!d.getElementsByTagName("link").length, t.style = /top/.test(i.getAttribute("style")), t.hrefNormalized = "/a" === i.getAttribute("href"), t.opacity = /^0.5/.test(i.style.opacity), t.cssFloat = !!i.style.cssFloat, t.checkOn = !!r.value, t.optSelected = s.selected, t.enctype = !!J.createElement("form").enctype, t.html5Clone = "<:nav></:nav>" !== J.createElement("nav").cloneNode(!0).outerHTML, t.inlineBlockNeedsLayout = !1, t.shrinkWrapBlocks = !1, t.pixelPosition = !1, t.deleteExpando = !0, t.noCloneEvent = !0, t.reliableMarginRight = !0, t.boxSizingReliable = !0, r.checked = !0, t.noCloneChecked = r.cloneNode(!0).checked, o.disabled = !0, t.optDisabled = !s.disabled;
        try {
            delete d.test
        } catch (h) {
            t.deleteExpando = !1
        }
        r = J.createElement("input"), r.setAttribute("value", ""), t.input = "" === r.getAttribute("value"), r.value = "t", r.setAttribute("type", "radio"), t.radioValue = "t" === r.value, r.setAttribute("checked", "t"), r.setAttribute("name", "t"), a = J.createDocumentFragment(), a.appendChild(r), t.appendChecked = r.checked, t.checkClone = a.cloneNode(!0).cloneNode(!0).lastChild.checked, d.attachEvent && (d.attachEvent("onclick", function () {
            t.noCloneEvent = !1
        }), d.cloneNode(!0).click());
        for (c in{submit: !0, change: !0, focusin: !0})d.setAttribute(l = "on" + c, "t"), t[c + "Bubbles"] = l in e || d.attributes[l].expando === !1;
        d.style.backgroundClip = "content-box", d.cloneNode(!0).style.backgroundClip = "", t.clearCloneStyle = "content-box" === d.style.backgroundClip;
        for (c in ct(t))break;
        return t.ownLast = "0" !== c, ct(function () {
            var n, i, r, o = "padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;", a = J.getElementsByTagName("body")[0];
            a && (n = J.createElement("div"), n.style.cssText = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px", a.appendChild(n).appendChild(d), d.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", r = d.getElementsByTagName("td"), r[0].style.cssText = "padding:0;margin:0;border:0;display:none", u = 0 === r[0].offsetHeight, r[0].style.display = "", r[1].style.display = "none", t.reliableHiddenOffsets = u && 0 === r[0].offsetHeight, d.innerHTML = "", d.style.cssText = "box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;", ct.swap(a, null != a.style.zoom ? {zoom: 1} : {}, function () {
                t.boxSizing = 4 === d.offsetWidth
            }), e.getComputedStyle && (t.pixelPosition = "1%" !== (e.getComputedStyle(d, null) || {}).top, t.boxSizingReliable = "4px" === (e.getComputedStyle(d, null) || {width: "4px"}).width, i = d.appendChild(J.createElement("div")), i.style.cssText = d.style.cssText = o, i.style.marginRight = i.style.width = "0", d.style.width = "1px", t.reliableMarginRight = !parseFloat((e.getComputedStyle(i, null) || {}).marginRight)), typeof d.style.zoom !== V && (d.innerHTML = "", d.style.cssText = o + "width:1px;padding:1px;display:inline;zoom:1", t.inlineBlockNeedsLayout = 3 === d.offsetWidth, d.style.display = "block", d.innerHTML = "<div></div>", d.firstChild.style.width = "5px", t.shrinkWrapBlocks = 3 !== d.offsetWidth, t.inlineBlockNeedsLayout && (a.style.zoom = 1)), a.removeChild(n), n = d = r = i = null)
        }), n = o = a = s = i = r = null, t
    }({});
    var Ft = /(?:\{[\s\S]*\}|\[[\s\S]*\])$/, Dt = /([A-Z])/g;
    ct.extend({cache: {}, noData: {applet: !0, embed: !0, object: "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"}, hasData: function (e) {
        return e = e.nodeType ? ct.cache[e[ct.expando]] : e[ct.expando], !!e && !s(e)
    }, data: function (e, t, n) {
        return r(e, t, n)
    }, removeData: function (e, t) {
        return o(e, t)
    }, _data: function (e, t, n) {
        return r(e, t, n, !0)
    }, _removeData: function (e, t) {
        return o(e, t, !0)
    }, acceptData: function (e) {
        if (e.nodeType && 1 !== e.nodeType && 9 !== e.nodeType)return!1;
        var t = e.nodeName && ct.noData[e.nodeName.toLowerCase()];
        return!t || t !== !0 && e.getAttribute("classid") === t
    }}), ct.fn.extend({data: function (e, n) {
        var i, r, o = null, s = 0, l = this[0];
        if (e === t) {
            if (this.length && (o = ct.data(l), 1 === l.nodeType && !ct._data(l, "parsedAttrs"))) {
                for (i = l.attributes; i.length > s; s++)r = i[s].name, 0 === r.indexOf("data-") && (r = ct.camelCase(r.slice(5)), a(l, r, o[r]));
                ct._data(l, "parsedAttrs", !0)
            }
            return o
        }
        return"object" == typeof e ? this.each(function () {
            ct.data(this, e)
        }) : arguments.length > 1 ? this.each(function () {
            ct.data(this, e, n)
        }) : l ? a(l, e, ct.data(l, e)) : null
    }, removeData: function (e) {
        return this.each(function () {
            ct.removeData(this, e)
        })
    }}), ct.extend({queue: function (e, n, i) {
        var r;
        return e ? (n = (n || "fx") + "queue", r = ct._data(e, n), i && (!r || ct.isArray(i) ? r = ct._data(e, n, ct.makeArray(i)) : r.push(i)), r || []) : t
    }, dequeue: function (e, t) {
        t = t || "fx";
        var n = ct.queue(e, t), i = n.length, r = n.shift(), o = ct._queueHooks(e, t), a = function () {
            ct.dequeue(e, t)
        };
        "inprogress" === r && (r = n.shift(), i--), r && ("fx" === t && n.unshift("inprogress"), delete o.stop, r.call(e, a, o)), !i && o && o.empty.fire()
    }, _queueHooks: function (e, t) {
        var n = t + "queueHooks";
        return ct._data(e, n) || ct._data(e, n, {empty: ct.Callbacks("once memory").add(function () {
            ct._removeData(e, t + "queue"), ct._removeData(e, n)
        })})
    }}), ct.fn.extend({queue: function (e, n) {
        var i = 2;
        return"string" != typeof e && (n = e, e = "fx", i--), i > arguments.length ? ct.queue(this[0], e) : n === t ? this : this.each(function () {
            var t = ct.queue(this, e, n);
            ct._queueHooks(this, e), "fx" === e && "inprogress" !== t[0] && ct.dequeue(this, e)
        })
    }, dequeue: function (e) {
        return this.each(function () {
            ct.dequeue(this, e)
        })
    }, delay: function (e, t) {
        return e = ct.fx ? ct.fx.speeds[e] || e : e, t = t || "fx", this.queue(t, function (t, n) {
            var i = setTimeout(t, e);
            n.stop = function () {
                clearTimeout(i)
            }
        })
    }, clearQueue: function (e) {
        return this.queue(e || "fx", [])
    }, promise: function (e, n) {
        var i, r = 1, o = ct.Deferred(), a = this, s = this.length, l = function () {
            --r || o.resolveWith(a, [a])
        };
        for ("string" != typeof e && (n = e, e = t), e = e || "fx"; s--;)i = ct._data(a[s], e + "queueHooks"), i && i.empty && (r++, i.empty.add(l));
        return l(), o.promise(n)
    }});
    var St, Et, Nt = /[\t\r\n\f]/g, Mt = /\r/g, jt = /^(?:input|select|textarea|button|object)$/i, At = /^(?:a|area)$/i, Lt = /^(?:checked|selected)$/i, Ht = ct.support.getSetAttribute, $t = ct.support.input;
    ct.fn.extend({attr: function (e, t) {
        return ct.access(this, ct.attr, e, t, arguments.length > 1)
    }, removeAttr: function (e) {
        return this.each(function () {
            ct.removeAttr(this, e)
        })
    }, prop: function (e, t) {
        return ct.access(this, ct.prop, e, t, arguments.length > 1)
    }, removeProp: function (e) {
        return e = ct.propFix[e] || e, this.each(function () {
            try {
                this[e] = t, delete this[e]
            } catch (n) {
            }
        })
    }, addClass: function (e) {
        var t, n, i, r, o, a = 0, s = this.length, l = "string" == typeof e && e;
        if (ct.isFunction(e))return this.each(function (t) {
            ct(this).addClass(e.call(this, t, this.className))
        });
        if (l)for (t = (e || "").match(ht) || []; s > a; a++)if (n = this[a], i = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace(Nt, " ") : " ")) {
            for (o = 0; r = t[o++];)0 > i.indexOf(" " + r + " ") && (i += r + " ");
            n.className = ct.trim(i)
        }
        return this
    }, removeClass: function (e) {
        var t, n, i, r, o, a = 0, s = this.length, l = 0 === arguments.length || "string" == typeof e && e;
        if (ct.isFunction(e))return this.each(function (t) {
            ct(this).removeClass(e.call(this, t, this.className))
        });
        if (l)for (t = (e || "").match(ht) || []; s > a; a++)if (n = this[a], i = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace(Nt, " ") : "")) {
            for (o = 0; r = t[o++];)for (; i.indexOf(" " + r + " ") >= 0;)i = i.replace(" " + r + " ", " ");
            n.className = e ? ct.trim(i) : ""
        }
        return this
    }, toggleClass: function (e, t) {
        var n = typeof e;
        return"boolean" == typeof t && "string" === n ? t ? this.addClass(e) : this.removeClass(e) : ct.isFunction(e) ? this.each(function (n) {
            ct(this).toggleClass(e.call(this, n, this.className, t), t)
        }) : this.each(function () {
            if ("string" === n)for (var t, i = 0, r = ct(this), o = e.match(ht) || []; t = o[i++];)r.hasClass(t) ? r.removeClass(t) : r.addClass(t); else(n === V || "boolean" === n) && (this.className && ct._data(this, "__className__", this.className), this.className = this.className || e === !1 ? "" : ct._data(this, "__className__") || "")
        })
    }, hasClass: function (e) {
        for (var t = " " + e + " ", n = 0, i = this.length; i > n; n++)if (1 === this[n].nodeType && (" " + this[n].className + " ").replace(Nt, " ").indexOf(t) >= 0)return!0;
        return!1
    }, val: function (e) {
        var n, i, r, o = this[0];
        return arguments.length ? (r = ct.isFunction(e), this.each(function (n) {
            var o;
            1 === this.nodeType && (o = r ? e.call(this, n, ct(this).val()) : e, null == o ? o = "" : "number" == typeof o ? o += "" : ct.isArray(o) && (o = ct.map(o, function (e) {
                return null == e ? "" : e + ""
            })), i = ct.valHooks[this.type] || ct.valHooks[this.nodeName.toLowerCase()], i && "set"in i && i.set(this, o, "value") !== t || (this.value = o))
        })) : o ? (i = ct.valHooks[o.type] || ct.valHooks[o.nodeName.toLowerCase()], i && "get"in i && (n = i.get(o, "value")) !== t ? n : (n = o.value, "string" == typeof n ? n.replace(Mt, "") : null == n ? "" : n)) : void 0
    }}), ct.extend({valHooks: {option: {get: function (e) {
        var t = ct.find.attr(e, "value");
        return null != t ? t : e.text
    }}, select: {get: function (e) {
        for (var t, n, i = e.options, r = e.selectedIndex, o = "select-one" === e.type || 0 > r, a = o ? null : [], s = o ? r + 1 : i.length, l = 0 > r ? s : o ? r : 0; s > l; l++)if (n = i[l], !(!n.selected && l !== r || (ct.support.optDisabled ? n.disabled : null !== n.getAttribute("disabled")) || n.parentNode.disabled && ct.nodeName(n.parentNode, "optgroup"))) {
            if (t = ct(n).val(), o)return t;
            a.push(t)
        }
        return a
    }, set: function (e, t) {
        for (var n, i, r = e.options, o = ct.makeArray(t), a = r.length; a--;)i = r[a], (i.selected = ct.inArray(ct(i).val(), o) >= 0) && (n = !0);
        return n || (e.selectedIndex = -1), o
    }}}, attr: function (e, n, i) {
        var r, o, a = e.nodeType;
        return e && 3 !== a && 8 !== a && 2 !== a ? typeof e.getAttribute === V ? ct.prop(e, n, i) : (1 === a && ct.isXMLDoc(e) || (n = n.toLowerCase(), r = ct.attrHooks[n] || (ct.expr.match.bool.test(n) ? Et : St)), i === t ? r && "get"in r && null !== (o = r.get(e, n)) ? o : (o = ct.find.attr(e, n), null == o ? t : o) : null !== i ? r && "set"in r && (o = r.set(e, i, n)) !== t ? o : (e.setAttribute(n, i + ""), i) : (ct.removeAttr(e, n), t)) : void 0
    }, removeAttr: function (e, t) {
        var n, i, r = 0, o = t && t.match(ht);
        if (o && 1 === e.nodeType)for (; n = o[r++];)i = ct.propFix[n] || n, ct.expr.match.bool.test(n) ? $t && Ht || !Lt.test(n) ? e[i] = !1 : e[ct.camelCase("default-" + n)] = e[i] = !1 : ct.attr(e, n, ""), e.removeAttribute(Ht ? n : i)
    }, attrHooks: {type: {set: function (e, t) {
        if (!ct.support.radioValue && "radio" === t && ct.nodeName(e, "input")) {
            var n = e.value;
            return e.setAttribute("type", t), n && (e.value = n), t
        }
    }}}, propFix: {"for": "htmlFor", "class": "className"}, prop: function (e, n, i) {
        var r, o, a, s = e.nodeType;
        return e && 3 !== s && 8 !== s && 2 !== s ? (a = 1 !== s || !ct.isXMLDoc(e), a && (n = ct.propFix[n] || n, o = ct.propHooks[n]), i !== t ? o && "set"in o && (r = o.set(e, i, n)) !== t ? r : e[n] = i : o && "get"in o && null !== (r = o.get(e, n)) ? r : e[n]) : void 0
    }, propHooks: {tabIndex: {get: function (e) {
        var t = ct.find.attr(e, "tabindex");
        return t ? parseInt(t, 10) : jt.test(e.nodeName) || At.test(e.nodeName) && e.href ? 0 : -1
    }}}}), Et = {set: function (e, t, n) {
        return t === !1 ? ct.removeAttr(e, n) : $t && Ht || !Lt.test(n) ? e.setAttribute(!Ht && ct.propFix[n] || n, n) : e[ct.camelCase("default-" + n)] = e[n] = !0, n
    }}, ct.each(ct.expr.match.bool.source.match(/\w+/g), function (e, n) {
        var i = ct.expr.attrHandle[n] || ct.find.attr;
        ct.expr.attrHandle[n] = $t && Ht || !Lt.test(n) ? function (e, n, r) {
            var o = ct.expr.attrHandle[n], a = r ? t : (ct.expr.attrHandle[n] = t) != i(e, n, r) ? n.toLowerCase() : null;
            return ct.expr.attrHandle[n] = o, a
        } : function (e, n, i) {
            return i ? t : e[ct.camelCase("default-" + n)] ? n.toLowerCase() : null
        }
    }), $t && Ht || (ct.attrHooks.value = {set: function (e, n, i) {
        return ct.nodeName(e, "input") ? (e.defaultValue = n, t) : St && St.set(e, n, i)
    }}), Ht || (St = {set: function (e, n, i) {
        var r = e.getAttributeNode(i);
        return r || e.setAttributeNode(r = e.ownerDocument.createAttribute(i)), r.value = n += "", "value" === i || n === e.getAttribute(i) ? n : t
    }}, ct.expr.attrHandle.id = ct.expr.attrHandle.name = ct.expr.attrHandle.coords = function (e, n, i) {
        var r;
        return i ? t : (r = e.getAttributeNode(n)) && "" !== r.value ? r.value : null
    }, ct.valHooks.button = {get: function (e, n) {
        var i = e.getAttributeNode(n);
        return i && i.specified ? i.value : t
    }, set: St.set}, ct.attrHooks.contenteditable = {set: function (e, t, n) {
        St.set(e, "" === t ? !1 : t, n)
    }}, ct.each(["width", "height"], function (e, n) {
        ct.attrHooks[n] = {set: function (e, i) {
            return"" === i ? (e.setAttribute(n, "auto"), i) : t
        }}
    })), ct.support.hrefNormalized || ct.each(["href", "src"], function (e, t) {
        ct.propHooks[t] = {get: function (e) {
            return e.getAttribute(t, 4)
        }}
    }), ct.support.style || (ct.attrHooks.style = {get: function (e) {
        return e.style.cssText || t
    }, set: function (e, t) {
        return e.style.cssText = t + ""
    }}), ct.support.optSelected || (ct.propHooks.selected = {get: function (e) {
        var t = e.parentNode;
        return t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex), null
    }}), ct.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function () {
        ct.propFix[this.toLowerCase()] = this
    }), ct.support.enctype || (ct.propFix.enctype = "encoding"), ct.each(["radio", "checkbox"], function () {
        ct.valHooks[this] = {set: function (e, n) {
            return ct.isArray(n) ? e.checked = ct.inArray(ct(e).val(), n) >= 0 : t
        }}, ct.support.checkOn || (ct.valHooks[this].get = function (e) {
            return null === e.getAttribute("value") ? "on" : e.value
        })
    });
    var Ot = /^(?:input|select|textarea)$/i, qt = /^key/, zt = /^(?:mouse|contextmenu)|click/, Rt = /^(?:focusinfocus|focusoutblur)$/, Pt = /^([^.]*)(?:\.(.+)|)$/;
    ct.event = {global: {}, add: function (e, n, i, r, o) {
        var a, s, l, u, c, d, h, f, p, m, g, v = ct._data(e);
        if (v) {
            for (i.handler && (u = i, i = u.handler, o = u.selector), i.guid || (i.guid = ct.guid++), (s = v.events) || (s = v.events = {}), (d = v.handle) || (d = v.handle = function (e) {
                return typeof ct === V || e && ct.event.triggered === e.type ? t : ct.event.dispatch.apply(d.elem, arguments)
            }, d.elem = e), n = (n || "").match(ht) || [""], l = n.length; l--;)a = Pt.exec(n[l]) || [], p = g = a[1], m = (a[2] || "").split(".").sort(), p && (c = ct.event.special[p] || {}, p = (o ? c.delegateType : c.bindType) || p, c = ct.event.special[p] || {}, h = ct.extend({type: p, origType: g, data: r, handler: i, guid: i.guid, selector: o, needsContext: o && ct.expr.match.needsContext.test(o), namespace: m.join(".")}, u), (f = s[p]) || (f = s[p] = [], f.delegateCount = 0, c.setup && c.setup.call(e, r, m, d) !== !1 || (e.addEventListener ? e.addEventListener(p, d, !1) : e.attachEvent && e.attachEvent("on" + p, d))), c.add && (c.add.call(e, h), h.handler.guid || (h.handler.guid = i.guid)), o ? f.splice(f.delegateCount++, 0, h) : f.push(h), ct.event.global[p] = !0);
            e = null
        }
    }, remove: function (e, t, n, i, r) {
        var o, a, s, l, u, c, d, h, f, p, m, g = ct.hasData(e) && ct._data(e);
        if (g && (c = g.events)) {
            for (t = (t || "").match(ht) || [""], u = t.length; u--;)if (s = Pt.exec(t[u]) || [], f = m = s[1], p = (s[2] || "").split(".").sort(), f) {
                for (d = ct.event.special[f] || {}, f = (i ? d.delegateType : d.bindType) || f, h = c[f] || [], s = s[2] && RegExp("(^|\\.)" + p.join("\\.(?:.*\\.|)") + "(\\.|$)"), l = o = h.length; o--;)a = h[o], !r && m !== a.origType || n && n.guid !== a.guid || s && !s.test(a.namespace) || i && i !== a.selector && ("**" !== i || !a.selector) || (h.splice(o, 1), a.selector && h.delegateCount--, d.remove && d.remove.call(e, a));
                l && !h.length && (d.teardown && d.teardown.call(e, p, g.handle) !== !1 || ct.removeEvent(e, f, g.handle), delete c[f])
            } else for (f in c)ct.event.remove(e, f + t[u], n, i, !0);
            ct.isEmptyObject(c) && (delete g.handle, ct._removeData(e, "events"))
        }
    }, trigger: function (n, i, r, o) {
        var a, s, l, u, c, d, h, f = [r || J], p = lt.call(n, "type") ? n.type : n, m = lt.call(n, "namespace") ? n.namespace.split(".") : [];
        if (l = d = r = r || J, 3 !== r.nodeType && 8 !== r.nodeType && !Rt.test(p + ct.event.triggered) && (p.indexOf(".") >= 0 && (m = p.split("."), p = m.shift(), m.sort()), s = 0 > p.indexOf(":") && "on" + p, n = n[ct.expando] ? n : new ct.Event(p, "object" == typeof n && n), n.isTrigger = o ? 2 : 3, n.namespace = m.join("."), n.namespace_re = n.namespace ? RegExp("(^|\\.)" + m.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, n.result = t, n.target || (n.target = r), i = null == i ? [n] : ct.makeArray(i, [n]), c = ct.event.special[p] || {}, o || !c.trigger || c.trigger.apply(r, i) !== !1)) {
            if (!o && !c.noBubble && !ct.isWindow(r)) {
                for (u = c.delegateType || p, Rt.test(u + p) || (l = l.parentNode); l; l = l.parentNode)f.push(l), d = l;
                d === (r.ownerDocument || J) && f.push(d.defaultView || d.parentWindow || e)
            }
            for (h = 0; (l = f[h++]) && !n.isPropagationStopped();)n.type = h > 1 ? u : c.bindType || p, a = (ct._data(l, "events") || {})[n.type] && ct._data(l, "handle"), a && a.apply(l, i), a = s && l[s], a && ct.acceptData(l) && a.apply && a.apply(l, i) === !1 && n.preventDefault();
            if (n.type = p, !o && !n.isDefaultPrevented() && (!c._default || c._default.apply(f.pop(), i) === !1) && ct.acceptData(r) && s && r[p] && !ct.isWindow(r)) {
                d = r[s], d && (r[s] = null), ct.event.triggered = p;
                try {
                    r[p]()
                } catch (g) {
                }
                ct.event.triggered = t, d && (r[s] = d)
            }
            return n.result
        }
    }, dispatch: function (e) {
        e = ct.event.fix(e);
        var n, i, r, o, a, s = [], l = ot.call(arguments), u = (ct._data(this, "events") || {})[e.type] || [], c = ct.event.special[e.type] || {};
        if (l[0] = e, e.delegateTarget = this, !c.preDispatch || c.preDispatch.call(this, e) !== !1) {
            for (s = ct.event.handlers.call(this, e, u), n = 0; (o = s[n++]) && !e.isPropagationStopped();)for (e.currentTarget = o.elem, a = 0; (r = o.handlers[a++]) && !e.isImmediatePropagationStopped();)(!e.namespace_re || e.namespace_re.test(r.namespace)) && (e.handleObj = r, e.data = r.data, i = ((ct.event.special[r.origType] || {}).handle || r.handler).apply(o.elem, l), i !== t && (e.result = i) === !1 && (e.preventDefault(), e.stopPropagation()));
            return c.postDispatch && c.postDispatch.call(this, e), e.result
        }
    }, handlers: function (e, n) {
        var i, r, o, a, s = [], l = n.delegateCount, u = e.target;
        if (l && u.nodeType && (!e.button || "click" !== e.type))for (; u != this; u = u.parentNode || this)if (1 === u.nodeType && (u.disabled !== !0 || "click" !== e.type)) {
            for (o = [], a = 0; l > a; a++)r = n[a], i = r.selector + " ", o[i] === t && (o[i] = r.needsContext ? ct(i, this).index(u) >= 0 : ct.find(i, this, null, [u]).length), o[i] && o.push(r);
            o.length && s.push({elem: u, handlers: o})
        }
        return n.length > l && s.push({elem: this, handlers: n.slice(l)}), s
    }, fix: function (e) {
        if (e[ct.expando])return e;
        var t, n, i, r = e.type, o = e, a = this.fixHooks[r];
        for (a || (this.fixHooks[r] = a = zt.test(r) ? this.mouseHooks : qt.test(r) ? this.keyHooks : {}), i = a.props ? this.props.concat(a.props) : this.props, e = new ct.Event(o), t = i.length; t--;)n = i[t], e[n] = o[n];
        return e.target || (e.target = o.srcElement || J), 3 === e.target.nodeType && (e.target = e.target.parentNode), e.metaKey = !!e.metaKey, a.filter ? a.filter(e, o) : e
    }, props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "), fixHooks: {}, keyHooks: {props: "char charCode key keyCode".split(" "), filter: function (e, t) {
        return null == e.which && (e.which = null != t.charCode ? t.charCode : t.keyCode), e
    }}, mouseHooks: {props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "), filter: function (e, n) {
        var i, r, o, a = n.button, s = n.fromElement;
        return null == e.pageX && null != n.clientX && (r = e.target.ownerDocument || J, o = r.documentElement, i = r.body, e.pageX = n.clientX + (o && o.scrollLeft || i && i.scrollLeft || 0) - (o && o.clientLeft || i && i.clientLeft || 0), e.pageY = n.clientY + (o && o.scrollTop || i && i.scrollTop || 0) - (o && o.clientTop || i && i.clientTop || 0)), !e.relatedTarget && s && (e.relatedTarget = s === e.target ? n.toElement : s), e.which || a === t || (e.which = 1 & a ? 1 : 2 & a ? 3 : 4 & a ? 2 : 0), e
    }}, special: {load: {noBubble: !0}, focus: {trigger: function () {
        if (this !== c() && this.focus)try {
            return this.focus(), !1
        } catch (e) {
        }
    }, delegateType: "focusin"}, blur: {trigger: function () {
        return this === c() && this.blur ? (this.blur(), !1) : t
    }, delegateType: "focusout"}, click: {trigger: function () {
        return ct.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(), !1) : t
    }, _default: function (e) {
        return ct.nodeName(e.target, "a")
    }}, beforeunload: {postDispatch: function (e) {
        e.result !== t && (e.originalEvent.returnValue = e.result)
    }}}, simulate: function (e, t, n, i) {
        var r = ct.extend(new ct.Event, n, {type: e, isSimulated: !0, originalEvent: {}});
        i ? ct.event.trigger(r, null, t) : ct.event.dispatch.call(t, r), r.isDefaultPrevented() && n.preventDefault()
    }}, ct.removeEvent = J.removeEventListener ? function (e, t, n) {
        e.removeEventListener && e.removeEventListener(t, n, !1)
    } : function (e, t, n) {
        var i = "on" + t;
        e.detachEvent && (typeof e[i] === V && (e[i] = null), e.detachEvent(i, n))
    }, ct.Event = function (e, n) {
        return this instanceof ct.Event ? (e && e.type ? (this.originalEvent = e, this.type = e.type, this.isDefaultPrevented = e.defaultPrevented || e.returnValue === !1 || e.getPreventDefault && e.getPreventDefault() ? l : u) : this.type = e, n && ct.extend(this, n), this.timeStamp = e && e.timeStamp || ct.now(), this[ct.expando] = !0, t) : new ct.Event(e, n)
    }, ct.Event.prototype = {isDefaultPrevented: u, isPropagationStopped: u, isImmediatePropagationStopped: u, preventDefault: function () {
        var e = this.originalEvent;
        this.isDefaultPrevented = l, e && (e.preventDefault ? e.preventDefault() : e.returnValue = !1)
    }, stopPropagation: function () {
        var e = this.originalEvent;
        this.isPropagationStopped = l, e && (e.stopPropagation && e.stopPropagation(), e.cancelBubble = !0)
    }, stopImmediatePropagation: function () {
        this.isImmediatePropagationStopped = l, this.stopPropagation()
    }}, ct.each({mouseenter: "mouseover", mouseleave: "mouseout"}, function (e, t) {
        ct.event.special[e] = {delegateType: t, bindType: t, handle: function (e) {
            var n, i = this, r = e.relatedTarget, o = e.handleObj;
            return(!r || r !== i && !ct.contains(i, r)) && (e.type = o.origType, n = o.handler.apply(this, arguments), e.type = t), n
        }}
    }), ct.support.submitBubbles || (ct.event.special.submit = {setup: function () {
        return ct.nodeName(this, "form") ? !1 : (ct.event.add(this, "click._submit keypress._submit", function (e) {
            var n = e.target, i = ct.nodeName(n, "input") || ct.nodeName(n, "button") ? n.form : t;
            i && !ct._data(i, "submitBubbles") && (ct.event.add(i, "submit._submit", function (e) {
                e._submit_bubble = !0
            }), ct._data(i, "submitBubbles", !0))
        }), t)
    }, postDispatch: function (e) {
        e._submit_bubble && (delete e._submit_bubble, this.parentNode && !e.isTrigger && ct.event.simulate("submit", this.parentNode, e, !0))
    }, teardown: function () {
        return ct.nodeName(this, "form") ? !1 : (ct.event.remove(this, "._submit"), t)
    }}), ct.support.changeBubbles || (ct.event.special.change = {setup: function () {
        return Ot.test(this.nodeName) ? (("checkbox" === this.type || "radio" === this.type) && (ct.event.add(this, "propertychange._change", function (e) {
            "checked" === e.originalEvent.propertyName && (this._just_changed = !0)
        }), ct.event.add(this, "click._change", function (e) {
            this._just_changed && !e.isTrigger && (this._just_changed = !1), ct.event.simulate("change", this, e, !0)
        })), !1) : (ct.event.add(this, "beforeactivate._change", function (e) {
            var t = e.target;
            Ot.test(t.nodeName) && !ct._data(t, "changeBubbles") && (ct.event.add(t, "change._change", function (e) {
                !this.parentNode || e.isSimulated || e.isTrigger || ct.event.simulate("change", this.parentNode, e, !0)
            }), ct._data(t, "changeBubbles", !0))
        }), t)
    }, handle: function (e) {
        var n = e.target;
        return this !== n || e.isSimulated || e.isTrigger || "radio" !== n.type && "checkbox" !== n.type ? e.handleObj.handler.apply(this, arguments) : t
    }, teardown: function () {
        return ct.event.remove(this, "._change"), !Ot.test(this.nodeName)
    }}), ct.support.focusinBubbles || ct.each({focus: "focusin", blur: "focusout"}, function (e, t) {
        var n = 0, i = function (e) {
            ct.event.simulate(t, e.target, ct.event.fix(e), !0)
        };
        ct.event.special[t] = {setup: function () {
            0 === n++ && J.addEventListener(e, i, !0)
        }, teardown: function () {
            0 === --n && J.removeEventListener(e, i, !0)
        }}
    }), ct.fn.extend({on: function (e, n, i, r, o) {
        var a, s;
        if ("object" == typeof e) {
            "string" != typeof n && (i = i || n, n = t);
            for (a in e)this.on(a, n, i, e[a], o);
            return this
        }
        if (null == i && null == r ? (r = n, i = n = t) : null == r && ("string" == typeof n ? (r = i, i = t) : (r = i, i = n, n = t)), r === !1)r = u; else if (!r)return this;
        return 1 === o && (s = r, r = function (e) {
            return ct().off(e), s.apply(this, arguments)
        }, r.guid = s.guid || (s.guid = ct.guid++)), this.each(function () {
            ct.event.add(this, e, r, i, n)
        })
    }, one: function (e, t, n, i) {
        return this.on(e, t, n, i, 1)
    }, off: function (e, n, i) {
        var r, o;
        if (e && e.preventDefault && e.handleObj)return r = e.handleObj, ct(e.delegateTarget).off(r.namespace ? r.origType + "." + r.namespace : r.origType, r.selector, r.handler), this;
        if ("object" == typeof e) {
            for (o in e)this.off(o, n, e[o]);
            return this
        }
        return(n === !1 || "function" == typeof n) && (i = n, n = t), i === !1 && (i = u), this.each(function () {
            ct.event.remove(this, e, i, n)
        })
    }, trigger: function (e, t) {
        return this.each(function () {
            ct.event.trigger(e, t, this)
        })
    }, triggerHandler: function (e, n) {
        var i = this[0];
        return i ? ct.event.trigger(e, n, i, !0) : t
    }});
    var Yt = /^.[^:#\[\.,]*$/, Bt = /^(?:parents|prev(?:Until|All))/, Gt = ct.expr.match.needsContext, Wt = {children: !0, contents: !0, next: !0, prev: !0};
    ct.fn.extend({find: function (e) {
        var t, n = [], i = this, r = i.length;
        if ("string" != typeof e)return this.pushStack(ct(e).filter(function () {
            for (t = 0; r > t; t++)if (ct.contains(i[t], this))return!0
        }));
        for (t = 0; r > t; t++)ct.find(e, i[t], n);
        return n = this.pushStack(r > 1 ? ct.unique(n) : n), n.selector = this.selector ? this.selector + " " + e : e, n
    }, has: function (e) {
        var t, n = ct(e, this), i = n.length;
        return this.filter(function () {
            for (t = 0; i > t; t++)if (ct.contains(this, n[t]))return!0
        })
    }, not: function (e) {
        return this.pushStack(h(this, e || [], !0))
    }, filter: function (e) {
        return this.pushStack(h(this, e || [], !1))
    }, is: function (e) {
        return!!h(this, "string" == typeof e && Gt.test(e) ? ct(e) : e || [], !1).length
    }, closest: function (e, t) {
        for (var n, i = 0, r = this.length, o = [], a = Gt.test(e) || "string" != typeof e ? ct(e, t || this.context) : 0; r > i; i++)for (n = this[i]; n && n !== t; n = n.parentNode)if (11 > n.nodeType && (a ? a.index(n) > -1 : 1 === n.nodeType && ct.find.matchesSelector(n, e))) {
            n = o.push(n);
            break
        }
        return this.pushStack(o.length > 1 ? ct.unique(o) : o)
    }, index: function (e) {
        return e ? "string" == typeof e ? ct.inArray(this[0], ct(e)) : ct.inArray(e.jquery ? e[0] : e, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
    }, add: function (e, t) {
        var n = "string" == typeof e ? ct(e, t) : ct.makeArray(e && e.nodeType ? [e] : e), i = ct.merge(this.get(), n);
        return this.pushStack(ct.unique(i))
    }, addBack: function (e) {
        return this.add(null == e ? this.prevObject : this.prevObject.filter(e))
    }}), ct.each({parent: function (e) {
        var t = e.parentNode;
        return t && 11 !== t.nodeType ? t : null
    }, parents: function (e) {
        return ct.dir(e, "parentNode")
    }, parentsUntil: function (e, t, n) {
        return ct.dir(e, "parentNode", n)
    }, next: function (e) {
        return d(e, "nextSibling")
    }, prev: function (e) {
        return d(e, "previousSibling")
    }, nextAll: function (e) {
        return ct.dir(e, "nextSibling")
    }, prevAll: function (e) {
        return ct.dir(e, "previousSibling")
    }, nextUntil: function (e, t, n) {
        return ct.dir(e, "nextSibling", n)
    }, prevUntil: function (e, t, n) {
        return ct.dir(e, "previousSibling", n)
    }, siblings: function (e) {
        return ct.sibling((e.parentNode || {}).firstChild, e)
    }, children: function (e) {
        return ct.sibling(e.firstChild)
    }, contents: function (e) {
        return ct.nodeName(e, "iframe") ? e.contentDocument || e.contentWindow.document : ct.merge([], e.childNodes)
    }}, function (e, t) {
        ct.fn[e] = function (n, i) {
            var r = ct.map(this, t, n);
            return"Until" !== e.slice(-5) && (i = n), i && "string" == typeof i && (r = ct.filter(i, r)), this.length > 1 && (Wt[e] || (r = ct.unique(r)), Bt.test(e) && (r = r.reverse())), this.pushStack(r)
        }
    }), ct.extend({filter: function (e, t, n) {
        var i = t[0];
        return n && (e = ":not(" + e + ")"), 1 === t.length && 1 === i.nodeType ? ct.find.matchesSelector(i, e) ? [i] : [] : ct.find.matches(e, ct.grep(t, function (e) {
            return 1 === e.nodeType
        }))
    }, dir: function (e, n, i) {
        for (var r = [], o = e[n]; o && 9 !== o.nodeType && (i === t || 1 !== o.nodeType || !ct(o).is(i));)1 === o.nodeType && r.push(o), o = o[n];
        return r
    }, sibling: function (e, t) {
        for (var n = []; e; e = e.nextSibling)1 === e.nodeType && e !== t && n.push(e);
        return n
    }});
    var Ut = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video", It = / jQuery\d+="(?:null|\d+)"/g, Vt = RegExp("<(?:" + Ut + ")[\\s/>]", "i"), Xt = /^\s+/, Jt = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi, Qt = /<([\w:]+)/, Zt = /<tbody/i, Kt = /<|&#?\w+;/, en = /<(?:script|style|link)/i, tn = /^(?:checkbox|radio)$/i, nn = /checked\s*(?:[^=]|=\s*.checked.)/i, rn = /^$|\/(?:java|ecma)script/i, on = /^true\/(.*)/, an = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g, sn = {option: [1, "<select multiple='multiple'>", "</select>"], legend: [1, "<fieldset>", "</fieldset>"], area: [1, "<map>", "</map>"], param: [1, "<object>", "</object>"], thead: [1, "<table>", "</table>"], tr: [2, "<table><tbody>", "</tbody></table>"], col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"], td: [3, "<table><tbody><tr>", "</tr></tbody></table>"], _default: ct.support.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]}, ln = f(J), un = ln.appendChild(J.createElement("div"));
    sn.optgroup = sn.option, sn.tbody = sn.tfoot = sn.colgroup = sn.caption = sn.thead, sn.th = sn.td, ct.fn.extend({text: function (e) {
        return ct.access(this, function (e) {
            return e === t ? ct.text(this) : this.empty().append((this[0] && this[0].ownerDocument || J).createTextNode(e))
        }, null, e, arguments.length)
    }, append: function () {
        return this.domManip(arguments, function (e) {
            if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                var t = p(this, e);
                t.appendChild(e)
            }
        })
    }, prepend: function () {
        return this.domManip(arguments, function (e) {
            if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                var t = p(this, e);
                t.insertBefore(e, t.firstChild)
            }
        })
    }, before: function () {
        return this.domManip(arguments, function (e) {
            this.parentNode && this.parentNode.insertBefore(e, this)
        })
    }, after: function () {
        return this.domManip(arguments, function (e) {
            this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
        })
    }, remove: function (e, t) {
        for (var n, i = e ? ct.filter(e, this) : this, r = 0; null != (n = i[r]); r++)t || 1 !== n.nodeType || ct.cleanData(w(n)), n.parentNode && (t && ct.contains(n.ownerDocument, n) && v(w(n, "script")), n.parentNode.removeChild(n));
        return this
    }, empty: function () {
        for (var e, t = 0; null != (e = this[t]); t++) {
            for (1 === e.nodeType && ct.cleanData(w(e, !1)); e.firstChild;)e.removeChild(e.firstChild);
            e.options && ct.nodeName(e, "select") && (e.options.length = 0)
        }
        return this
    }, clone: function (e, t) {
        return e = null == e ? !1 : e, t = null == t ? e : t, this.map(function () {
            return ct.clone(this, e, t)
        })
    }, html: function (e) {
        return ct.access(this, function (e) {
            var n = this[0] || {}, i = 0, r = this.length;
            if (e === t)return 1 === n.nodeType ? n.innerHTML.replace(It, "") : t;
            if (!("string" != typeof e || en.test(e) || !ct.support.htmlSerialize && Vt.test(e) || !ct.support.leadingWhitespace && Xt.test(e) || sn[(Qt.exec(e) || ["", ""])[1].toLowerCase()])) {
                e = e.replace(Jt, "<$1></$2>");
                try {
                    for (; r > i; i++)n = this[i] || {}, 1 === n.nodeType && (ct.cleanData(w(n, !1)), n.innerHTML = e);
                    n = 0
                } catch (o) {
                }
            }
            n && this.empty().append(e)
        }, null, e, arguments.length)
    }, replaceWith: function () {
        var e = ct.map(this, function (e) {
            return[e.nextSibling, e.parentNode]
        }), t = 0;
        return this.domManip(arguments, function (n) {
            var i = e[t++], r = e[t++];
            r && (i && i.parentNode !== r && (i = this.nextSibling), ct(this).remove(), r.insertBefore(n, i))
        }, !0), t ? this : this.remove()
    }, detach: function (e) {
        return this.remove(e, !0)
    }, domManip: function (e, t, n) {
        e = it.apply([], e);
        var i, r, o, a, s, l, u = 0, c = this.length, d = this, h = c - 1, f = e[0], p = ct.isFunction(f);
        if (p || !(1 >= c || "string" != typeof f || ct.support.checkClone) && nn.test(f))return this.each(function (i) {
            var r = d.eq(i);
            p && (e[0] = f.call(this, i, r.html())), r.domManip(e, t, n)
        });
        if (c && (l = ct.buildFragment(e, this[0].ownerDocument, !1, !n && this), i = l.firstChild, 1 === l.childNodes.length && (l = i), i)) {
            for (a = ct.map(w(l, "script"), m), o = a.length; c > u; u++)r = l, u !== h && (r = ct.clone(r, !0, !0), o && ct.merge(a, w(r, "script"))), t.call(this[u], r, u);
            if (o)for (s = a[a.length - 1].ownerDocument, ct.map(a, g), u = 0; o > u; u++)r = a[u], rn.test(r.type || "") && !ct._data(r, "globalEval") && ct.contains(s, r) && (r.src ? ct._evalUrl(r.src) : ct.globalEval((r.text || r.textContent || r.innerHTML || "").replace(an, "")));
            l = i = null
        }
        return this
    }}), ct.each({appendTo: "append", prependTo: "prepend", insertBefore: "before", insertAfter: "after", replaceAll: "replaceWith"}, function (e, t) {
        ct.fn[e] = function (e) {
            for (var n, i = 0, r = [], o = ct(e), a = o.length - 1; a >= i; i++)n = i === a ? this : this.clone(!0), ct(o[i])[t](n), rt.apply(r, n.get());
            return this.pushStack(r)
        }
    }), ct.extend({clone: function (e, t, n) {
        var i, r, o, a, s, l = ct.contains(e.ownerDocument, e);
        if (ct.support.html5Clone || ct.isXMLDoc(e) || !Vt.test("<" + e.nodeName + ">") ? o = e.cloneNode(!0) : (un.innerHTML = e.outerHTML, un.removeChild(o = un.firstChild)), !(ct.support.noCloneEvent && ct.support.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || ct.isXMLDoc(e)))for (i = w(o), s = w(e), a = 0; null != (r = s[a]); ++a)i[a] && b(r, i[a]);
        if (t)if (n)for (s = s || w(e), i = i || w(o), a = 0; null != (r = s[a]); a++)y(r, i[a]); else y(e, o);
        return i = w(o, "script"), i.length > 0 && v(i, !l && w(e, "script")), i = s = r = null, o
    }, buildFragment: function (e, t, n, i) {
        for (var r, o, a, s, l, u, c, d = e.length, h = f(t), p = [], m = 0; d > m; m++)if (o = e[m], o || 0 === o)if ("object" === ct.type(o))ct.merge(p, o.nodeType ? [o] : o); else if (Kt.test(o)) {
            for (s = s || h.appendChild(t.createElement("div")), l = (Qt.exec(o) || ["", ""])[1].toLowerCase(), c = sn[l] || sn._default, s.innerHTML = c[1] + o.replace(Jt, "<$1></$2>") + c[2], r = c[0]; r--;)s = s.lastChild;
            if (!ct.support.leadingWhitespace && Xt.test(o) && p.push(t.createTextNode(Xt.exec(o)[0])), !ct.support.tbody)for (o = "table" !== l || Zt.test(o) ? "<table>" !== c[1] || Zt.test(o) ? 0 : s : s.firstChild, r = o && o.childNodes.length; r--;)ct.nodeName(u = o.childNodes[r], "tbody") && !u.childNodes.length && o.removeChild(u);
            for (ct.merge(p, s.childNodes), s.textContent = ""; s.firstChild;)s.removeChild(s.firstChild);
            s = h.lastChild
        } else p.push(t.createTextNode(o));
        for (s && h.removeChild(s), ct.support.appendChecked || ct.grep(w(p, "input"), x), m = 0; o = p[m++];)if ((!i || -1 === ct.inArray(o, i)) && (a = ct.contains(o.ownerDocument, o), s = w(h.appendChild(o), "script"), a && v(s), n))for (r = 0; o = s[r++];)rn.test(o.type || "") && n.push(o);
        return s = null, h
    }, cleanData: function (e, t) {
        for (var n, i, r, o, a = 0, s = ct.expando, l = ct.cache, u = ct.support.deleteExpando, c = ct.event.special; null != (n = e[a]); a++)if ((t || ct.acceptData(n)) && (r = n[s], o = r && l[r])) {
            if (o.events)for (i in o.events)c[i] ? ct.event.remove(n, i) : ct.removeEvent(n, i, o.handle);
            l[r] && (delete l[r], u ? delete n[s] : typeof n.removeAttribute !== V ? n.removeAttribute(s) : n[s] = null, tt.push(r))
        }
    }, _evalUrl: function (e) {
        return ct.ajax({url: e, type: "GET", dataType: "script", async: !1, global: !1, "throws": !0})
    }}), ct.fn.extend({wrapAll: function (e) {
        if (ct.isFunction(e))return this.each(function (t) {
            ct(this).wrapAll(e.call(this, t))
        });
        if (this[0]) {
            var t = ct(e, this[0].ownerDocument).eq(0).clone(!0);
            this[0].parentNode && t.insertBefore(this[0]), t.map(function () {
                for (var e = this; e.firstChild && 1 === e.firstChild.nodeType;)e = e.firstChild;
                return e
            }).append(this)
        }
        return this
    }, wrapInner: function (e) {
        return ct.isFunction(e) ? this.each(function (t) {
            ct(this).wrapInner(e.call(this, t))
        }) : this.each(function () {
            var t = ct(this), n = t.contents();
            n.length ? n.wrapAll(e) : t.append(e)
        })
    }, wrap: function (e) {
        var t = ct.isFunction(e);
        return this.each(function (n) {
            ct(this).wrapAll(t ? e.call(this, n) : e)
        })
    }, unwrap: function () {
        return this.parent().each(function () {
            ct.nodeName(this, "body") || ct(this).replaceWith(this.childNodes)
        }).end()
    }});
    var cn, dn, hn, fn = /alpha\([^)]*\)/i, pn = /opacity\s*=\s*([^)]*)/, mn = /^(top|right|bottom|left)$/, gn = /^(none|table(?!-c[ea]).+)/, vn = /^margin/, yn = RegExp("^(" + dt + ")(.*)$", "i"), bn = RegExp("^(" + dt + ")(?!px)[a-z%]+$", "i"), wn = RegExp("^([+-])=(" + dt + ")", "i"), xn = {BODY: "block"}, Cn = {position: "absolute", visibility: "hidden", display: "block"}, kn = {letterSpacing: 0, fontWeight: 400}, Tn = ["Top", "Right", "Bottom", "Left"], _n = ["Webkit", "O", "Moz", "ms"];
    ct.fn.extend({css: function (e, n) {
        return ct.access(this, function (e, n, i) {
            var r, o, a = {}, s = 0;
            if (ct.isArray(n)) {
                for (o = dn(e), r = n.length; r > s; s++)a[n[s]] = ct.css(e, n[s], !1, o);
                return a
            }
            return i !== t ? ct.style(e, n, i) : ct.css(e, n)
        }, e, n, arguments.length > 1)
    }, show: function () {
        return T(this, !0)
    }, hide: function () {
        return T(this)
    }, toggle: function (e) {
        return"boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function () {
            k(this) ? ct(this).show() : ct(this).hide()
        })
    }}), ct.extend({cssHooks: {opacity: {get: function (e, t) {
        if (t) {
            var n = hn(e, "opacity");
            return"" === n ? "1" : n
        }
    }}}, cssNumber: {columnCount: !0, fillOpacity: !0, fontWeight: !0, lineHeight: !0, opacity: !0, order: !0, orphans: !0, widows: !0, zIndex: !0, zoom: !0}, cssProps: {"float": ct.support.cssFloat ? "cssFloat" : "styleFloat"}, style: function (e, n, i, r) {
        if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
            var o, a, s, l = ct.camelCase(n), u = e.style;
            if (n = ct.cssProps[l] || (ct.cssProps[l] = C(u, l)), s = ct.cssHooks[n] || ct.cssHooks[l], i === t)return s && "get"in s && (o = s.get(e, !1, r)) !== t ? o : u[n];
            if (a = typeof i, "string" === a && (o = wn.exec(i)) && (i = (o[1] + 1) * o[2] + parseFloat(ct.css(e, n)), a = "number"), !(null == i || "number" === a && isNaN(i) || ("number" !== a || ct.cssNumber[l] || (i += "px"), ct.support.clearCloneStyle || "" !== i || 0 !== n.indexOf("background") || (u[n] = "inherit"), s && "set"in s && (i = s.set(e, i, r)) === t)))try {
                u[n] = i
            } catch (c) {
            }
        }
    }, css: function (e, n, i, r) {
        var o, a, s, l = ct.camelCase(n);
        return n = ct.cssProps[l] || (ct.cssProps[l] = C(e.style, l)), s = ct.cssHooks[n] || ct.cssHooks[l], s && "get"in s && (a = s.get(e, !0, i)), a === t && (a = hn(e, n, r)), "normal" === a && n in kn && (a = kn[n]), "" === i || i ? (o = parseFloat(a), i === !0 || ct.isNumeric(o) ? o || 0 : a) : a
    }}), e.getComputedStyle ? (dn = function (t) {
        return e.getComputedStyle(t, null)
    }, hn = function (e, n, i) {
        var r, o, a, s = i || dn(e), l = s ? s.getPropertyValue(n) || s[n] : t, u = e.style;
        return s && ("" !== l || ct.contains(e.ownerDocument, e) || (l = ct.style(e, n)), bn.test(l) && vn.test(n) && (r = u.width, o = u.minWidth, a = u.maxWidth, u.minWidth = u.maxWidth = u.width = l, l = s.width, u.width = r, u.minWidth = o, u.maxWidth = a)), l
    }) : J.documentElement.currentStyle && (dn = function (e) {
        return e.currentStyle
    }, hn = function (e, n, i) {
        var r, o, a, s = i || dn(e), l = s ? s[n] : t, u = e.style;
        return null == l && u && u[n] && (l = u[n]), bn.test(l) && !mn.test(n) && (r = u.left, o = e.runtimeStyle, a = o && o.left, a && (o.left = e.currentStyle.left), u.left = "fontSize" === n ? "1em" : l, l = u.pixelLeft + "px", u.left = r, a && (o.left = a)), "" === l ? "auto" : l
    }), ct.each(["height", "width"], function (e, n) {
        ct.cssHooks[n] = {get: function (e, i, r) {
            return i ? 0 === e.offsetWidth && gn.test(ct.css(e, "display")) ? ct.swap(e, Cn, function () {
                return D(e, n, r)
            }) : D(e, n, r) : t
        }, set: function (e, t, i) {
            var r = i && dn(e);
            return _(e, t, i ? F(e, n, i, ct.support.boxSizing && "border-box" === ct.css(e, "boxSizing", !1, r), r) : 0)
        }}
    }), ct.support.opacity || (ct.cssHooks.opacity = {get: function (e, t) {
        return pn.test((t && e.currentStyle ? e.currentStyle.filter : e.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : t ? "1" : ""
    }, set: function (e, t) {
        var n = e.style, i = e.currentStyle, r = ct.isNumeric(t) ? "alpha(opacity=" + 100 * t + ")" : "", o = i && i.filter || n.filter || "";
        n.zoom = 1, (t >= 1 || "" === t) && "" === ct.trim(o.replace(fn, "")) && n.removeAttribute && (n.removeAttribute("filter"), "" === t || i && !i.filter) || (n.filter = fn.test(o) ? o.replace(fn, r) : o + " " + r)
    }}), ct(function () {
        ct.support.reliableMarginRight || (ct.cssHooks.marginRight = {get: function (e, n) {
            return n ? ct.swap(e, {display: "inline-block"}, hn, [e, "marginRight"]) : t
        }}), !ct.support.pixelPosition && ct.fn.position && ct.each(["top", "left"], function (e, n) {
            ct.cssHooks[n] = {get: function (e, i) {
                return i ? (i = hn(e, n), bn.test(i) ? ct(e).position()[n] + "px" : i) : t
            }}
        })
    }), ct.expr && ct.expr.filters && (ct.expr.filters.hidden = function (e) {
        return 0 >= e.offsetWidth && 0 >= e.offsetHeight || !ct.support.reliableHiddenOffsets && "none" === (e.style && e.style.display || ct.css(e, "display"))
    }, ct.expr.filters.visible = function (e) {
        return!ct.expr.filters.hidden(e)
    }), ct.each({margin: "", padding: "", border: "Width"}, function (e, t) {
        ct.cssHooks[e + t] = {expand: function (n) {
            for (var i = 0, r = {}, o = "string" == typeof n ? n.split(" ") : [n]; 4 > i; i++)r[e + Tn[i] + t] = o[i] || o[i - 2] || o[0];
            return r
        }}, vn.test(e) || (ct.cssHooks[e + t].set = _)
    });
    var Fn = /%20/g, Dn = /\[\]$/, Sn = /\r?\n/g, En = /^(?:submit|button|image|reset|file)$/i, Nn = /^(?:input|select|textarea|keygen)/i;
    ct.fn.extend({serialize: function () {
        return ct.param(this.serializeArray())
    }, serializeArray: function () {
        return this.map(function () {
            var e = ct.prop(this, "elements");
            return e ? ct.makeArray(e) : this
        }).filter(function () {
            var e = this.type;
            return this.name && !ct(this).is(":disabled") && Nn.test(this.nodeName) && !En.test(e) && (this.checked || !tn.test(e))
        }).map(function (e, t) {
            var n = ct(this).val();
            return null == n ? null : ct.isArray(n) ? ct.map(n, function (e) {
                return{name: t.name, value: e.replace(Sn, "\r\n")}
            }) : {name: t.name, value: n.replace(Sn, "\r\n")}
        }).get()
    }}), ct.param = function (e, n) {
        var i, r = [], o = function (e, t) {
            t = ct.isFunction(t) ? t() : null == t ? "" : t, r[r.length] = encodeURIComponent(e) + "=" + encodeURIComponent(t)
        };
        if (n === t && (n = ct.ajaxSettings && ct.ajaxSettings.traditional), ct.isArray(e) || e.jquery && !ct.isPlainObject(e))ct.each(e, function () {
            o(this.name, this.value)
        }); else for (i in e)N(i, e[i], n, o);
        return r.join("&").replace(Fn, "+")
    }, ct.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function (e, t) {
        ct.fn[t] = function (e, n) {
            return arguments.length > 0 ? this.on(t, null, e, n) : this.trigger(t)
        }
    }), ct.fn.extend({hover: function (e, t) {
        return this.mouseenter(e).mouseleave(t || e)
    }, bind: function (e, t, n) {
        return this.on(e, null, t, n)
    }, unbind: function (e, t) {
        return this.off(e, null, t)
    }, delegate: function (e, t, n, i) {
        return this.on(t, e, n, i)
    }, undelegate: function (e, t, n) {
        return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
    }});
    var Mn, jn, An = ct.now(), Ln = /\?/, Hn = /#.*$/, $n = /([?&])_=[^&]*/, On = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm, qn = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/, zn = /^(?:GET|HEAD)$/, Rn = /^\/\//, Pn = /^([\w.+-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/, Yn = ct.fn.load, Bn = {}, Gn = {}, Wn = "*/".concat("*");
    try {
        jn = X.href
    } catch (Un) {
        jn = J.createElement("a"), jn.href = "", jn = jn.href
    }
    Mn = Pn.exec(jn.toLowerCase()) || [], ct.fn.load = function (e, n, i) {
        if ("string" != typeof e && Yn)return Yn.apply(this, arguments);
        var r, o, a, s = this, l = e.indexOf(" ");
        return l >= 0 && (r = e.slice(l, e.length), e = e.slice(0, l)), ct.isFunction(n) ? (i = n, n = t) : n && "object" == typeof n && (a = "POST"), s.length > 0 && ct.ajax({url: e, type: a, dataType: "html", data: n}).done(function (e) {
            o = arguments, s.html(r ? ct("<div>").append(ct.parseHTML(e)).find(r) : e)
        }).complete(i && function (e, t) {
            s.each(i, o || [e.responseText, t, e])
        }), this
    }, ct.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function (e, t) {
        ct.fn[t] = function (e) {
            return this.on(t, e)
        }
    }), ct.extend({active: 0, lastModified: {}, etag: {}, ajaxSettings: {url: jn, type: "GET", isLocal: qn.test(Mn[1]), global: !0, processData: !0, async: !0, contentType: "application/x-www-form-urlencoded; charset=UTF-8", accepts: {"*": Wn, text: "text/plain", html: "text/html", xml: "application/xml, text/xml", json: "application/json, text/javascript"}, contents: {xml: /xml/, html: /html/, json: /json/}, responseFields: {xml: "responseXML", text: "responseText", json: "responseJSON"}, converters: {"* text": String, "text html": !0, "text json": ct.parseJSON, "text xml": ct.parseXML}, flatOptions: {url: !0, context: !0}}, ajaxSetup: function (e, t) {
        return t ? A(A(e, ct.ajaxSettings), t) : A(ct.ajaxSettings, e)
    }, ajaxPrefilter: M(Bn), ajaxTransport: M(Gn), ajax: function (e, n) {
        function i(e, n, i, r) {
            var o, d, y, b, x, k = n;
            2 !== w && (w = 2, l && clearTimeout(l), c = t, s = r || "", C.readyState = e > 0 ? 4 : 0, o = e >= 200 && 300 > e || 304 === e, i && (b = L(h, C, i)), b = H(h, b, C, o), o ? (h.ifModified && (x = C.getResponseHeader("Last-Modified"), x && (ct.lastModified[a] = x), x = C.getResponseHeader("etag"), x && (ct.etag[a] = x)), 204 === e || "HEAD" === h.type ? k = "nocontent" : 304 === e ? k = "notmodified" : (k = b.state, d = b.data, y = b.error, o = !y)) : (y = k, (e || !k) && (k = "error", 0 > e && (e = 0))), C.status = e, C.statusText = (n || k) + "", o ? m.resolveWith(f, [d, k, C]) : m.rejectWith(f, [C, k, y]), C.statusCode(v), v = t, u && p.trigger(o ? "ajaxSuccess" : "ajaxError", [C, h, o ? d : y]), g.fireWith(f, [C, k]), u && (p.trigger("ajaxComplete", [C, h]), --ct.active || ct.event.trigger("ajaxStop")))
        }

        "object" == typeof e && (n = e, e = t), n = n || {};
        var r, o, a, s, l, u, c, d, h = ct.ajaxSetup({}, n), f = h.context || h, p = h.context && (f.nodeType || f.jquery) ? ct(f) : ct.event, m = ct.Deferred(), g = ct.Callbacks("once memory"), v = h.statusCode || {}, y = {}, b = {}, w = 0, x = "canceled", C = {readyState: 0, getResponseHeader: function (e) {
            var t;
            if (2 === w) {
                if (!d)for (d = {}; t = On.exec(s);)d[t[1].toLowerCase()] = t[2];
                t = d[e.toLowerCase()]
            }
            return null == t ? null : t
        }, getAllResponseHeaders: function () {
            return 2 === w ? s : null
        }, setRequestHeader: function (e, t) {
            var n = e.toLowerCase();
            return w || (e = b[n] = b[n] || e, y[e] = t), this
        }, overrideMimeType: function (e) {
            return w || (h.mimeType = e), this
        }, statusCode: function (e) {
            var t;
            if (e)if (2 > w)for (t in e)v[t] = [v[t], e[t]]; else C.always(e[C.status]);
            return this
        }, abort: function (e) {
            var t = e || x;
            return c && c.abort(t), i(0, t), this
        }};
        if (m.promise(C).complete = g.add, C.success = C.done, C.error = C.fail, h.url = ((e || h.url || jn) + "").replace(Hn, "").replace(Rn, Mn[1] + "//"), h.type = n.method || n.type || h.method || h.type, h.dataTypes = ct.trim(h.dataType || "*").toLowerCase().match(ht) || [""], null == h.crossDomain && (r = Pn.exec(h.url.toLowerCase()), h.crossDomain = !(!r || r[1] === Mn[1] && r[2] === Mn[2] && (r[3] || ("http:" === r[1] ? "80" : "443")) === (Mn[3] || ("http:" === Mn[1] ? "80" : "443")))), h.data && h.processData && "string" != typeof h.data && (h.data = ct.param(h.data, h.traditional)), j(Bn, h, n, C), 2 === w)return C;
        u = h.global, u && 0 === ct.active++ && ct.event.trigger("ajaxStart"), h.type = h.type.toUpperCase(), h.hasContent = !zn.test(h.type), a = h.url, h.hasContent || (h.data && (a = h.url += (Ln.test(a) ? "&" : "?") + h.data, delete h.data), h.cache === !1 && (h.url = $n.test(a) ? a.replace($n, "$1_=" + An++) : a + (Ln.test(a) ? "&" : "?") + "_=" + An++)), h.ifModified && (ct.lastModified[a] && C.setRequestHeader("If-Modified-Since", ct.lastModified[a]), ct.etag[a] && C.setRequestHeader("If-None-Match", ct.etag[a])), (h.data && h.hasContent && h.contentType !== !1 || n.contentType) && C.setRequestHeader("Content-Type", h.contentType), C.setRequestHeader("Accept", h.dataTypes[0] && h.accepts[h.dataTypes[0]] ? h.accepts[h.dataTypes[0]] + ("*" !== h.dataTypes[0] ? ", " + Wn + "; q=0.01" : "") : h.accepts["*"]);
        for (o in h.headers)C.setRequestHeader(o, h.headers[o]);
        if (h.beforeSend && (h.beforeSend.call(f, C, h) === !1 || 2 === w))return C.abort();
        x = "abort";
        for (o in{success: 1, error: 1, complete: 1})C[o](h[o]);
        if (c = j(Gn, h, n, C)) {
            C.readyState = 1, u && p.trigger("ajaxSend", [C, h]), h.async && h.timeout > 0 && (l = setTimeout(function () {
                C.abort("timeout")
            }, h.timeout));
            try {
                w = 1, c.send(y, i)
            } catch (k) {
                if (!(2 > w))throw k;
                i(-1, k)
            }
        } else i(-1, "No Transport");
        return C
    }, getJSON: function (e, t, n) {
        return ct.get(e, t, n, "json")
    }, getScript: function (e, n) {
        return ct.get(e, t, n, "script")
    }}), ct.each(["get", "post"], function (e, n) {
        ct[n] = function (e, i, r, o) {
            return ct.isFunction(i) && (o = o || r, r = i, i = t), ct.ajax({url: e, type: n, dataType: o, data: i, success: r})
        }
    }), ct.ajaxSetup({accepts: {script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"}, contents: {script: /(?:java|ecma)script/}, converters: {"text script": function (e) {
        return ct.globalEval(e), e
    }}}), ct.ajaxPrefilter("script", function (e) {
        e.cache === t && (e.cache = !1), e.crossDomain && (e.type = "GET", e.global = !1)
    }), ct.ajaxTransport("script", function (e) {
        if (e.crossDomain) {
            var n, i = J.head || ct("head")[0] || J.documentElement;
            return{send: function (t, r) {
                n = J.createElement("script"), n.async = !0, e.scriptCharset && (n.charset = e.scriptCharset), n.src = e.url, n.onload = n.onreadystatechange = function (e, t) {
                    (t || !n.readyState || /loaded|complete/.test(n.readyState)) && (n.onload = n.onreadystatechange = null, n.parentNode && n.parentNode.removeChild(n), n = null, t || r(200, "success"))
                }, i.insertBefore(n, i.firstChild)
            }, abort: function () {
                n && n.onload(t, !0)
            }}
        }
    });
    var In = [], Vn = /(=)\?(?=&|$)|\?\?/;
    ct.ajaxSetup({jsonp: "callback", jsonpCallback: function () {
        var e = In.pop() || ct.expando + "_" + An++;
        return this[e] = !0, e
    }}), ct.ajaxPrefilter("json jsonp", function (n, i, r) {
        var o, a, s, l = n.jsonp !== !1 && (Vn.test(n.url) ? "url" : "string" == typeof n.data && !(n.contentType || "").indexOf("application/x-www-form-urlencoded") && Vn.test(n.data) && "data");
        return l || "jsonp" === n.dataTypes[0] ? (o = n.jsonpCallback = ct.isFunction(n.jsonpCallback) ? n.jsonpCallback() : n.jsonpCallback, l ? n[l] = n[l].replace(Vn, "$1" + o) : n.jsonp !== !1 && (n.url += (Ln.test(n.url) ? "&" : "?") + n.jsonp + "=" + o), n.converters["script json"] = function () {
            return s || ct.error(o + " was not called"), s[0]
        }, n.dataTypes[0] = "json", a = e[o], e[o] = function () {
            s = arguments
        }, r.always(function () {
            e[o] = a, n[o] && (n.jsonpCallback = i.jsonpCallback, In.push(o)), s && ct.isFunction(a) && a(s[0]), s = a = t
        }), "script") : t
    });
    var Xn, Jn, Qn = 0, Zn = e.ActiveXObject && function () {
        var e;
        for (e in Xn)Xn[e](t, !0)
    };
    ct.ajaxSettings.xhr = e.ActiveXObject ? function () {
        return!this.isLocal && $() || O()
    } : $, Jn = ct.ajaxSettings.xhr(), ct.support.cors = !!Jn && "withCredentials"in Jn, Jn = ct.support.ajax = !!Jn, Jn && ct.ajaxTransport(function (n) {
        if (!n.crossDomain || ct.support.cors) {
            var i;
            return{send: function (r, o) {
                var a, s, l = n.xhr();
                if (n.username ? l.open(n.type, n.url, n.async, n.username, n.password) : l.open(n.type, n.url, n.async), n.xhrFields)for (s in n.xhrFields)l[s] = n.xhrFields[s];
                n.mimeType && l.overrideMimeType && l.overrideMimeType(n.mimeType), n.crossDomain || r["X-Requested-With"] || (r["X-Requested-With"] = "XMLHttpRequest");
                try {
                    for (s in r)l.setRequestHeader(s, r[s])
                } catch (u) {
                }
                l.send(n.hasContent && n.data || null), i = function (e, r) {
                    var s, u, c, d;
                    try {
                        if (i && (r || 4 === l.readyState))if (i = t, a && (l.onreadystatechange = ct.noop, Zn && delete Xn[a]), r)4 !== l.readyState && l.abort(); else {
                            d = {}, s = l.status, u = l.getAllResponseHeaders(), "string" == typeof l.responseText && (d.text = l.responseText);
                            try {
                                c = l.statusText
                            } catch (h) {
                                c = ""
                            }
                            s || !n.isLocal || n.crossDomain ? 1223 === s && (s = 204) : s = d.text ? 200 : 404
                        }
                    } catch (f) {
                        r || o(-1, f)
                    }
                    d && o(s, c, d, u)
                }, n.async ? 4 === l.readyState ? setTimeout(i) : (a = ++Qn, Zn && (Xn || (Xn = {}, ct(e).unload(Zn)), Xn[a] = i), l.onreadystatechange = i) : i()
            }, abort: function () {
                i && i(t, !0)
            }}
        }
    });
    var Kn, ei, ti = /^(?:toggle|show|hide)$/, ni = RegExp("^(?:([+-])=|)(" + dt + ")([a-z%]*)$", "i"), ii = /queueHooks$/, ri = [Y], oi = {"*": [function (e, t) {
        var n = this.createTween(e, t), i = n.cur(), r = ni.exec(t), o = r && r[3] || (ct.cssNumber[e] ? "" : "px"), a = (ct.cssNumber[e] || "px" !== o && +i) && ni.exec(ct.css(n.elem, e)), s = 1, l = 20;
        if (a && a[3] !== o) {
            o = o || a[3], r = r || [], a = +i || 1;
            do s = s || ".5", a /= s, ct.style(n.elem, e, a + o); while (s !== (s = n.cur() / i) && 1 !== s && --l)
        }
        return r && (a = n.start = +a || +i || 0, n.unit = o, n.end = r[1] ? a + (r[1] + 1) * r[2] : +r[2]), n
    }]};
    ct.Animation = ct.extend(R, {tweener: function (e, t) {
        ct.isFunction(e) ? (t = e, e = ["*"]) : e = e.split(" ");
        for (var n, i = 0, r = e.length; r > i; i++)n = e[i], oi[n] = oi[n] || [], oi[n].unshift(t)
    }, prefilter: function (e, t) {
        t ? ri.unshift(e) : ri.push(e)
    }}), ct.Tween = B, B.prototype = {constructor: B, init: function (e, t, n, i, r, o) {
        this.elem = e, this.prop = n, this.easing = r || "swing", this.options = t, this.start = this.now = this.cur(), this.end = i, this.unit = o || (ct.cssNumber[n] ? "" : "px")
    }, cur: function () {
        var e = B.propHooks[this.prop];
        return e && e.get ? e.get(this) : B.propHooks._default.get(this)
    }, run: function (e) {
        var t, n = B.propHooks[this.prop];
        return this.pos = t = this.options.duration ? ct.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : e, this.now = (this.end - this.start) * t + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), n && n.set ? n.set(this) : B.propHooks._default.set(this), this
    }}, B.prototype.init.prototype = B.prototype, B.propHooks = {_default: {get: function (e) {
        var t;
        return null == e.elem[e.prop] || e.elem.style && null != e.elem.style[e.prop] ? (t = ct.css(e.elem, e.prop, ""), t && "auto" !== t ? t : 0) : e.elem[e.prop]
    }, set: function (e) {
        ct.fx.step[e.prop] ? ct.fx.step[e.prop](e) : e.elem.style && (null != e.elem.style[ct.cssProps[e.prop]] || ct.cssHooks[e.prop]) ? ct.style(e.elem, e.prop, e.now + e.unit) : e.elem[e.prop] = e.now
    }}}, B.propHooks.scrollTop = B.propHooks.scrollLeft = {set: function (e) {
        e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
    }}, ct.each(["toggle", "show", "hide"], function (e, t) {
        var n = ct.fn[t];
        ct.fn[t] = function (e, i, r) {
            return null == e || "boolean" == typeof e ? n.apply(this, arguments) : this.animate(G(t, !0), e, i, r)
        }
    }), ct.fn.extend({fadeTo: function (e, t, n, i) {
        return this.filter(k).css("opacity", 0).show().end().animate({opacity: t}, e, n, i)
    }, animate: function (e, t, n, i) {
        var r = ct.isEmptyObject(e), o = ct.speed(t, n, i), a = function () {
            var t = R(this, ct.extend({}, e), o);
            (r || ct._data(this, "finish")) && t.stop(!0)
        };
        return a.finish = a, r || o.queue === !1 ? this.each(a) : this.queue(o.queue, a)
    }, stop: function (e, n, i) {
        var r = function (e) {
            var t = e.stop;
            delete e.stop, t(i)
        };
        return"string" != typeof e && (i = n, n = e, e = t), n && e !== !1 && this.queue(e || "fx", []), this.each(function () {
            var t = !0, n = null != e && e + "queueHooks", o = ct.timers, a = ct._data(this);
            if (n)a[n] && a[n].stop && r(a[n]); else for (n in a)a[n] && a[n].stop && ii.test(n) && r(a[n]);
            for (n = o.length; n--;)o[n].elem !== this || null != e && o[n].queue !== e || (o[n].anim.stop(i), t = !1, o.splice(n, 1));
            (t || !i) && ct.dequeue(this, e)
        })
    }, finish: function (e) {
        return e !== !1 && (e = e || "fx"), this.each(function () {
            var t, n = ct._data(this), i = n[e + "queue"], r = n[e + "queueHooks"], o = ct.timers, a = i ? i.length : 0;
            for (n.finish = !0, ct.queue(this, e, []), r && r.stop && r.stop.call(this, !0), t = o.length; t--;)o[t].elem === this && o[t].queue === e && (o[t].anim.stop(!0), o.splice(t, 1));
            for (t = 0; a > t; t++)i[t] && i[t].finish && i[t].finish.call(this);
            delete n.finish
        })
    }}), ct.each({slideDown: G("show"), slideUp: G("hide"), slideToggle: G("toggle"), fadeIn: {opacity: "show"}, fadeOut: {opacity: "hide"}, fadeToggle: {opacity: "toggle"}}, function (e, t) {
        ct.fn[e] = function (e, n, i) {
            return this.animate(t, e, n, i)
        }
    }), ct.speed = function (e, t, n) {
        var i = e && "object" == typeof e ? ct.extend({}, e) : {complete: n || !n && t || ct.isFunction(e) && e, duration: e, easing: n && t || t && !ct.isFunction(t) && t};
        return i.duration = ct.fx.off ? 0 : "number" == typeof i.duration ? i.duration : i.duration in ct.fx.speeds ? ct.fx.speeds[i.duration] : ct.fx.speeds._default, (null == i.queue || i.queue === !0) && (i.queue = "fx"), i.old = i.complete, i.complete = function () {
            ct.isFunction(i.old) && i.old.call(this), i.queue && ct.dequeue(this, i.queue)
        }, i
    }, ct.easing = {linear: function (e) {
        return e
    }, swing: function (e) {
        return.5 - Math.cos(e * Math.PI) / 2
    }}, ct.timers = [], ct.fx = B.prototype.init, ct.fx.tick = function () {
        var e, n = ct.timers, i = 0;
        for (Kn = ct.now(); n.length > i; i++)e = n[i], e() || n[i] !== e || n.splice(i--, 1);
        n.length || ct.fx.stop(), Kn = t
    }, ct.fx.timer = function (e) {
        e() && ct.timers.push(e) && ct.fx.start()
    }, ct.fx.interval = 13, ct.fx.start = function () {
        ei || (ei = setInterval(ct.fx.tick, ct.fx.interval))
    }, ct.fx.stop = function () {
        clearInterval(ei), ei = null
    }, ct.fx.speeds = {slow: 600, fast: 200, _default: 400}, ct.fx.step = {}, ct.expr && ct.expr.filters && (ct.expr.filters.animated = function (e) {
        return ct.grep(ct.timers,function (t) {
            return e === t.elem
        }).length
    }), ct.fn.offset = function (e) {
        if (arguments.length)return e === t ? this : this.each(function (t) {
            ct.offset.setOffset(this, e, t)
        });
        var n, i, r = {top: 0, left: 0}, o = this[0], a = o && o.ownerDocument;
        return a ? (n = a.documentElement, ct.contains(n, o) ? (typeof o.getBoundingClientRect !== V && (r = o.getBoundingClientRect()), i = W(a), {top: r.top + (i.pageYOffset || n.scrollTop) - (n.clientTop || 0), left: r.left + (i.pageXOffset || n.scrollLeft) - (n.clientLeft || 0)}) : r) : void 0
    }, ct.offset = {setOffset: function (e, t, n) {
        var i = ct.css(e, "position");
        "static" === i && (e.style.position = "relative");
        var r, o, a = ct(e), s = a.offset(), l = ct.css(e, "top"), u = ct.css(e, "left"), c = ("absolute" === i || "fixed" === i) && ct.inArray("auto", [l, u]) > -1, d = {}, h = {};
        c ? (h = a.position(), r = h.top, o = h.left) : (r = parseFloat(l) || 0, o = parseFloat(u) || 0), ct.isFunction(t) && (t = t.call(e, n, s)), null != t.top && (d.top = t.top - s.top + r), null != t.left && (d.left = t.left - s.left + o), "using"in t ? t.using.call(e, d) : a.css(d)
    }}, ct.fn.extend({position: function () {
        if (this[0]) {
            var e, t, n = {top: 0, left: 0}, i = this[0];
            return"fixed" === ct.css(i, "position") ? t = i.getBoundingClientRect() : (e = this.offsetParent(), t = this.offset(), ct.nodeName(e[0], "html") || (n = e.offset()), n.top += ct.css(e[0], "borderTopWidth", !0), n.left += ct.css(e[0], "borderLeftWidth", !0)), {top: t.top - n.top - ct.css(i, "marginTop", !0), left: t.left - n.left - ct.css(i, "marginLeft", !0)}
        }
    }, offsetParent: function () {
        return this.map(function () {
            for (var e = this.offsetParent || Q; e && !ct.nodeName(e, "html") && "static" === ct.css(e, "position");)e = e.offsetParent;
            return e || Q
        })
    }}), ct.each({scrollLeft: "pageXOffset", scrollTop: "pageYOffset"}, function (e, n) {
        var i = /Y/.test(n);
        ct.fn[e] = function (r) {
            return ct.access(this, function (e, r, o) {
                var a = W(e);
                return o === t ? a ? n in a ? a[n] : a.document.documentElement[r] : e[r] : (a ? a.scrollTo(i ? ct(a).scrollLeft() : o, i ? o : ct(a).scrollTop()) : e[r] = o, t)
            }, e, r, arguments.length, null)
        }
    }), ct.each({Height: "height", Width: "width"}, function (e, n) {
        ct.each({padding: "inner" + e, content: n, "": "outer" + e}, function (i, r) {
            ct.fn[r] = function (r, o) {
                var a = arguments.length && (i || "boolean" != typeof r), s = i || (r === !0 || o === !0 ? "margin" : "border");
                return ct.access(this, function (n, i, r) {
                    var o;
                    return ct.isWindow(n) ? n.document.documentElement["client" + e] : 9 === n.nodeType ? (o = n.documentElement, Math.max(n.body["scroll" + e], o["scroll" + e], n.body["offset" + e], o["offset" + e], o["client" + e])) : r === t ? ct.css(n, i, s) : ct.style(n, i, r, s)
                }, n, a ? r : t, a, null)
            }
        })
    }), ct.fn.size = function () {
        return this.length
    }, ct.fn.andSelf = ct.fn.addBack, "object" == typeof module && module && "object" == typeof module.exports ? module.exports = ct : (e.jQuery = e.$ = ct, "function" == typeof define && define.amd && define("jquery", [], function () {
        return ct
    }))
}(window), define("avltree", [], function () {
    function e(t) {
        this.comparator_ = t || e.DEFAULT_COMPARATOR_
    }

    return e.DEFAULT_COMPARATOR_ = function (e, t) {
        return String(e) < String(t) ? -1 : String(e) > String(t) ? 1 : 0
    }, e.prototype.root_ = null, e.prototype.comparator_ = null, e.prototype.minNode_ = null, e.prototype.maxNode_ = null, e.prototype.add = function (t) {
        if (null == this.root_)return this.root_ = new e.Node(t), this.minNode_ = this.root_, this.maxNode_ = this.root_, !0;
        var n = null;
        return this.traverse_(function (i) {
            var r = null;
            return this.comparator_(i.value, t) > 0 ? (r = i.left, null == i.left && (n = new e.Node(t, i), i.left = n, i == this.minNode_ && (this.minNode_ = n))) : this.comparator_(i.value, t) < 0 ? (r = i.right, null == i.right && (n = new e.Node(t, i), i.right = n, i == this.maxNode_ && (this.maxNode_ = n))) : i.value = t, r
        }), n && (this.traverse_(function (e) {
            return e.count++, e.parent
        }, n.parent), this.balance_(n.parent)), !!n
    }, e.prototype.remove = function (e) {
        var t = null;
        return this.traverse_(function (n) {
            var i = null;
            return this.comparator_(n.value, [e, null]) > 0 ? i = n.left : this.comparator_(n.value, [e, null]) < 0 ? i = n.right : (t = n.value, this.removeNode_(n)), i
        }), t
    }, e.prototype.clear = function () {
        this.root_ = null, this.minNode_ = null, this.maxNode_ = null
    }, e.prototype.contains = function (e) {
        var t = !1;
        return this.traverse_(function (n) {
            var i = null;
            return this.comparator_(n.value, e) > 0 ? i = n.left : this.comparator_(n.value, e) < 0 ? i = n.right : t = !0, i
        }), t
    }, e.prototype.get = function (e) {
        var t = null;
        return this.traverse_(function (n) {
            var i = null;
            return this.comparator_(n.value, [e, null]) > 0 ? i = n.left : this.comparator_(n.value, [e, null]) < 0 ? i = n.right : t = n.value, i
        }), t ? t[1] : null
    }, e.prototype.getCount = function () {
        return this.root_ ? this.root_.count : 0
    }, e.prototype.getKthValue = function (e) {
        return 0 > e || e >= this.getCount() ? null : this.getKthNode_(e).value
    }, e.prototype.getMinimum = function () {
        return this.getMinNode_().value
    }, e.prototype.getMaximum = function () {
        return this.getMaxNode_().value
    }, e.prototype.getHeight = function () {
        return this.root_ ? this.root_.height : 0
    }, e.prototype.getValues = function () {
        var e = [];
        return this.inOrderTraverse(function (t) {
            e.push(t)
        }), e
    }, e.prototype.inOrderTraverse = function (e, t) {
        if (this.root_) {
            var n;
            t ? this.traverse_(function (e) {
                var i = null;
                return this.comparator_(e.value, t) > 0 ? (i = e.left, n = e) : this.comparator_(e.value, t) < 0 ? i = e.right : n = e, i
            }) : n = this.getMinNode_();
            for (var i = n, r = n.left ? n.left : n; null != i;)if (null != i.left && i.left != r && i.right != r)i = i.left; else {
                if (i.right != r && e(i.value))return;
                var o = i;
                i = null != i.right && i.right != r ? i.right : i.parent, r = o
            }
        }
    }, e.prototype.reverseOrderTraverse = function (e, t) {
        if (this.root_) {
            var n;
            t ? this.traverse_(goog.bind(function (e) {
                var i = null;
                return this.comparator_(e.value, t) > 0 ? i = e.left : this.comparator_(e.value, t) < 0 ? (i = e.right, n = e) : n = e, i
            }, this)) : n = this.getMaxNode_();
            for (var i = n, r = n.right ? n.right : n; null != i;)if (null != i.right && i.right != r && i.left != r)i = i.right; else {
                if (i.left != r && e(i.value))return;
                var o = i;
                i = null != i.left && i.left != r ? i.left : i.parent, r = o
            }
        }
    }, e.prototype.traverse_ = function (e, t, n) {
        for (var i = t ? t : this.root_, r = n ? n : null; i && i != r;)i = e.call(this, i)
    }, e.prototype.balance_ = function (e) {
        this.traverse_(function (e) {
            var t = e.left ? e.left.height : 0, n = e.right ? e.right.height : 0;
            return t - n > 1 ? (e.left.right && (!e.left.left || e.left.left.height < e.left.right.height) && this.leftRotate_(e.left), this.rightRotate_(e)) : n - t > 1 && (e.right.left && (!e.right.right || e.right.right.height < e.right.left.height) && this.rightRotate_(e.right), this.leftRotate_(e)), t = e.left ? e.left.height : 0, n = e.right ? e.right.height : 0, e.height = Math.max(t, n) + 1, e.parent
        }, e)
    }, e.prototype.leftRotate_ = function (e) {
        e.isLeftChild() ? (e.parent.left = e.right, e.right.parent = e.parent) : e.isRightChild() ? (e.parent.right = e.right, e.right.parent = e.parent) : (this.root_ = e.right, this.root_.parent = null);
        var t = e.right;
        e.right = e.right.left, null != e.right && (e.right.parent = e), t.left = e, e.parent = t, t.count = e.count, e.count -= (t.right ? t.right.count : 0) + 1
    }, e.prototype.rightRotate_ = function (e) {
        e.isLeftChild() ? (e.parent.left = e.left, e.left.parent = e.parent) : e.isRightChild() ? (e.parent.right = e.left, e.left.parent = e.parent) : (this.root_ = e.left, this.root_.parent = null);
        var t = e.left;
        e.left = e.left.right, null != e.left && (e.left.parent = e), t.right = e, e.parent = t, t.count = e.count, e.count -= (t.left ? t.left.count : 0) + 1
    }, e.prototype.removeNode_ = function (e) {
        if (null != e.left || null != e.right) {
            var t, n = null;
            null != e.left ? (t = this.getMaxNode_(e.left), this.traverse_(function (e) {
                return e.count--, e.parent
            }, t), t != e.left && (t.parent.right = t.left, t.left && (t.left.parent = t.parent), t.left = e.left, t.left.parent = t, n = t.parent), t.parent = e.parent, t.right = e.right, t.right && (t.right.parent = t), e == this.maxNode_ && (this.maxNode_ = t), t.count = e.count) : (t = this.getMinNode_(e.right), this.traverse_(function (e) {
                return e.count--, e.parent
            }, t), t != e.right && (t.parent.left = t.right, t.right && (t.right.parent = t.parent), t.right = e.right, t.right.parent = t, n = t.parent), t.parent = e.parent, t.left = e.left, t.left && (t.left.parent = t), e == this.minNode_ && (this.minNode_ = t), t.count = e.count), e.isLeftChild() ? e.parent.left = t : e.isRightChild() ? e.parent.right = t : this.root_ = t, this.balance_(n ? n : t)
        } else this.traverse_(function (e) {
            return e.count--, e.parent
        }, e.parent), e.isLeftChild() ? (this.special = 1, e.parent.left = null, e == this.minNode_ && (this.minNode_ = e.parent), this.balance_(e.parent)) : e.isRightChild() ? (e.parent.right = null, e == this.maxNode_ && (this.maxNode_ = e.parent), this.balance_(e.parent)) : this.clear()
    }, e.prototype.getKthNode_ = function (e, t) {
        var n = t || this.root_, i = n.left ? n.left.count : 0;
        return i > e ? this.getKthNode_(e, n.left) : e == i ? n : this.getKthNode_(e - i - 1, n.right)
    }, e.prototype.getMinNode_ = function (e) {
        if (!e)return this.minNode_;
        var t = e;
        return this.traverse_(function (e) {
            var n = null;
            return e.left && (t = e.left, n = e.left), n
        }, e), t
    }, e.prototype.getMaxNode_ = function (e) {
        if (!e)return this.maxNode_;
        var t = e;
        return this.traverse_(function (e) {
            var n = null;
            return e.right && (t = e.right, n = e.right), n
        }, e), t
    }, e.Node = function (e, t) {
        this.value = e, this.parent = t ? t : null, this.count = 1
    }, e.Node.prototype.left = null, e.Node.prototype.right = null, e.Node.prototype.height = 1, e.Node.prototype.isRightChild = function () {
        return!!this.parent && this.parent.right == this
    }, e.Node.prototype.isLeftChild = function () {
        return!!this.parent && this.parent.left == this
    }, e
}), define("async", [], function () {
    function e(e) {
        var t, n;
        t = document.createElement("script"), t.type = "text/javascript", t.async = !0, t.src = e, n = document.getElementsByTagName("script")[0], n.parentNode.insertBefore(t, n)
    }

    function t(e, t) {
        var n = /!(.+)/, r = e.replace(n, ""), o = n.test(e) ? e.replace(/.+!/, "") : i;
        return r += r.indexOf("?") < 0 ? "?" : "&", r + o + "=" + t
    }

    function n() {
        return r += 1, "__async_req_" + r + "__"
    }

    var i = "callback", r = 0;
    return{load: function (i, r, o, a) {
        if (a.isBuild)o(null); else {
            var s = n();
            window[s] = o, e(t(i, s))
        }
    }}
}), define("propertyParser", [], function () {
    function e(e) {
        for (var i, r = {}; i = n.exec(e);)r[i[1]] = t(i[2] || i[3]);
        return r
    }

    function t(e) {
        return i.test(e) ? e = e.replace(i, "$1").split(",") : "null" === e ? e = null : "false" === e ? e = !1 : "true" === e ? e = !0 : "" === e || "''" === e || '""' === e ? e = "" : isNaN(e) || (e = +e), e
    }

    var n = /([\w-]+)\s*:\s*(?:(\[[^\]]+\])|([^,]+)),?/g, i = /^\[([^\]]+)\]$/;
    return{parseProperties: e, typecastVal: t}
}), define("goog", ["async", "propertyParser"], function (e, t) {
    function n(e) {
        var n = i.exec(e), r = {moduleName: n[1], version: n[2] || "1"};
        return r.settings = t.parseProperties(n[3]), r
    }

    var i = /^([^,]+)(?:,([^,]+))?(?:,(.+))?/;
    return{load: function (e, t, i, r) {
        if (r.isBuild)i(null); else {
            var o = n(e), a = o.settings;
            a.callback = i, t(["async!" + ("https:" === document.location.protocol ? "https" : "http") + "://www.google.com/jsapi"], function () {
                google.load(o.moduleName, o.version, a)
            })
        }
    }}
}), function (e) {
    e.extend(e.fn, {validate: function (t) {
        if (!this.length)return t && t.debug && window.console && console.warn("Nothing selected, can't validate, returning nothing."), void 0;
        var n = e.data(this[0], "validator");
        return n ? n : (this.attr("novalidate", "novalidate"), n = new e.validator(t, this[0]), e.data(this[0], "validator", n), n.settings.onsubmit && (this.validateDelegate(":submit", "click", function (t) {
            n.settings.submitHandler && (n.submitButton = t.target), e(t.target).hasClass("cancel") && (n.cancelSubmit = !0)
        }), this.submit(function (t) {
            function i() {
                var i;
                return n.settings.submitHandler ? (n.submitButton && (i = e("<input type='hidden'/>").attr("name", n.submitButton.name).val(n.submitButton.value).appendTo(n.currentForm)), n.settings.submitHandler.call(n, n.currentForm, t), n.submitButton && i.remove(), !1) : !0
            }

            return n.settings.debug && t.preventDefault(), n.cancelSubmit ? (n.cancelSubmit = !1, i()) : n.form() ? n.pendingRequest ? (n.formSubmitted = !0, !1) : i() : (n.focusInvalid(), !1)
        })), n)
    }, valid: function () {
        if (e(this[0]).is("form"))return this.validate().form();
        var t = !0, n = e(this[0].form).validate();
        return this.each(function () {
            t &= n.element(this)
        }), t
    }, removeAttrs: function (t) {
        var n = {}, i = this;
        return e.each(t.split(/\s/), function (e, t) {
            n[t] = i.attr(t), i.removeAttr(t)
        }), n
    }, rules: function (t, n) {
        var i = this[0];
        if (t) {
            var r = e.data(i.form, "validator").settings, o = r.rules, a = e.validator.staticRules(i);
            switch (t) {
                case"add":
                    e.extend(a, e.validator.normalizeRule(n)), delete a.messages, o[i.name] = a, n.messages && (r.messages[i.name] = e.extend(r.messages[i.name], n.messages));
                    break;
                case"remove":
                    if (!n)return delete o[i.name], a;
                    var s = {};
                    return e.each(n.split(/\s/), function (e, t) {
                        s[t] = a[t], delete a[t]
                    }), s
            }
        }
        var l = e.validator.normalizeRules(e.extend({}, e.validator.classRules(i), e.validator.attributeRules(i), e.validator.dataRules(i), e.validator.staticRules(i)), i);
        if (l.required) {
            var u = l.required;
            delete l.required, l = e.extend({required: u}, l)
        }
        return l
    }}), e.extend(e.expr[":"], {blank: function (t) {
        return!e.trim("" + t.value)
    }, filled: function (t) {
        return!!e.trim("" + t.value)
    }, unchecked: function (e) {
        return!e.checked
    }}), e.validator = function (t, n) {
        this.settings = e.extend(!0, {}, e.validator.defaults, t), this.currentForm = n, this.init()
    }, e.validator.format = function (t, n) {
        return 1 === arguments.length ? function () {
            var n = e.makeArray(arguments);
            return n.unshift(t), e.validator.format.apply(this, n)
        } : (arguments.length > 2 && n.constructor !== Array && (n = e.makeArray(arguments).slice(1)), n.constructor !== Array && (n = [n]), e.each(n, function (e, n) {
            t = t.replace(new RegExp("\\{" + e + "\\}", "g"), function () {
                return n
            })
        }), t)
    }, e.extend(e.validator, {defaults: {messages: {}, groups: {}, rules: {}, errorClass: "error", validClass: "valid", errorElement: "label", focusInvalid: !0, errorContainer: e([]), errorLabelContainer: e([]), onsubmit: !0, ignore: ":hidden", ignoreTitle: !1, onfocusin: function (e) {
        this.lastActive = e, this.settings.focusCleanup && !this.blockFocusCleanup && (this.settings.unhighlight && this.settings.unhighlight.call(this, e, this.settings.errorClass, this.settings.validClass), this.addWrapper(this.errorsFor(e)).hide())
    }, onfocusout: function (e) {
        this.checkable(e) || !(e.name in this.submitted) && this.optional(e) || this.element(e)
    }, onkeyup: function (e, t) {
        (9 !== t.which || "" !== this.elementValue(e)) && (e.name in this.submitted || e === this.lastElement) && this.element(e)
    }, onclick: function (e) {
        e.name in this.submitted ? this.element(e) : e.parentNode.name in this.submitted && this.element(e.parentNode)
    }, highlight: function (t, n, i) {
        "radio" === t.type ? this.findByName(t.name).addClass(n).removeClass(i) : e(t).addClass(n).removeClass(i)
    }, unhighlight: function (t, n, i) {
        "radio" === t.type ? this.findByName(t.name).removeClass(n).addClass(i) : e(t).removeClass(n).addClass(i)
    }}, setDefaults: function (t) {
        e.extend(e.validator.defaults, t)
    }, messages: {required: "This field is required.", remote: "Please fix this field.", email: "Please enter a valid email address.", url: "Please enter a valid URL.", date: "Please enter a valid date.", dateISO: "Please enter a valid date (ISO).", number: "Please enter a valid number.", digits: "Please enter only digits.", creditcard: "Please enter a valid credit card number.", equalTo: "Please enter the same value again.", maxlength: e.validator.format("Please enter no more than {0} characters."), minlength: e.validator.format("Please enter at least {0} characters."), rangelength: e.validator.format("Please enter a value between {0} and {1} characters long."), range: e.validator.format("Please enter a value between {0} and {1}."), max: e.validator.format("Please enter a value less than or equal to {0}."), min: e.validator.format("Please enter a value greater than or equal to {0}.")}, autoCreateRanges: !1, prototype: {init: function () {
        function t(t) {
            var n = e.data(this[0].form, "validator"), i = "on" + t.type.replace(/^validate/, "");
            n.settings[i] && n.settings[i].call(n, this[0], t)
        }

        this.labelContainer = e(this.settings.errorLabelContainer), this.errorContext = this.labelContainer.length && this.labelContainer || e(this.currentForm), this.containers = e(this.settings.errorContainer).add(this.settings.errorLabelContainer), this.submitted = {}, this.valueCache = {}, this.pendingRequest = 0, this.pending = {}, this.invalid = {}, this.reset();
        var n = this.groups = {};
        e.each(this.settings.groups, function (t, i) {
            "string" == typeof i && (i = i.split(/\s/)), e.each(i, function (e, i) {
                n[i] = t
            })
        });
        var i = this.settings.rules;
        e.each(i, function (t, n) {
            i[t] = e.validator.normalizeRule(n)
        }), e(this.currentForm).validateDelegate(":text, [type='password'], [type='file'], select, textarea, [type='number'], [type='search'] ,[type='tel'], [type='url'], [type='email'], [type='datetime'], [type='date'], [type='month'], [type='week'], [type='time'], [type='datetime-local'], [type='range'], [type='color'] ", "focusin focusout keyup", t).validateDelegate("[type='radio'], [type='checkbox'], select, option", "click", t), this.settings.invalidHandler && e(this.currentForm).bind("invalid-form.validate", this.settings.invalidHandler)
    }, form: function () {
        return this.checkForm(), e.extend(this.submitted, this.errorMap), this.invalid = e.extend({}, this.errorMap), this.valid() || e(this.currentForm).triggerHandler("invalid-form", [this]), this.showErrors(), this.valid()
    }, checkForm: function () {
        this.prepareForm();
        for (var e = 0, t = this.currentElements = this.elements(); t[e]; e++)this.check(t[e]);
        return this.valid()
    }, element: function (t) {
        t = this.validationTargetFor(this.clean(t)), this.lastElement = t, this.prepareElement(t), this.currentElements = e(t);
        var n = this.check(t) !== !1;
        return n ? delete this.invalid[t.name] : this.invalid[t.name] = !0, this.numberOfInvalids() || (this.toHide = this.toHide.add(this.containers)), this.showErrors(), n
    }, showErrors: function (t) {
        if (t) {
            e.extend(this.errorMap, t), this.errorList = [];
            for (var n in t)this.errorList.push({message: t[n], element: this.findByName(n)[0]});
            this.successList = e.grep(this.successList, function (e) {
                return!(e.name in t)
            })
        }
        this.settings.showErrors ? this.settings.showErrors.call(this, this.errorMap, this.errorList) : this.defaultShowErrors()
    }, resetForm: function () {
        e.fn.resetForm && e(this.currentForm).resetForm(), this.submitted = {}, this.lastElement = null, this.prepareForm(), this.hideErrors(), this.elements().removeClass(this.settings.errorClass).removeData("previousValue")
    }, numberOfInvalids: function () {
        return this.objectLength(this.invalid)
    }, objectLength: function (e) {
        var t = 0;
        for (var n in e)t++;
        return t
    }, hideErrors: function () {
        this.addWrapper(this.toHide).hide()
    }, valid: function () {
        return 0 === this.size()
    }, size: function () {
        return this.errorList.length
    }, focusInvalid: function () {
        if (this.settings.focusInvalid)try {
            e(this.findLastActive() || this.errorList.length && this.errorList[0].element || []).filter(":visible").focus().trigger("focusin")
        } catch (t) {
        }
    }, findLastActive: function () {
        var t = this.lastActive;
        return t && 1 === e.grep(this.errorList,function (e) {
            return e.element.name === t.name
        }).length && t
    }, elements: function () {
        var t = this, n = {};
        return e(this.currentForm).find("input, select, textarea").not(":submit, :reset, :image, [disabled]").not(this.settings.ignore).filter(function () {
            if (!this.name)throw window.console && console.error("%o has no name assigned", this), new Error("Failed to validate, found an element with no name assigned. See console for element reference.");
            return this.name in n || !t.objectLength(e(this).rules()) ? !1 : (n[this.name] = !0, !0)
        })
    }, clean: function (t) {
        return e(t)[0]
    }, errors: function () {
        var t = this.settings.errorClass.replace(" ", ".");
        return e(this.settings.errorElement + "." + t, this.errorContext)
    }, reset: function () {
        this.successList = [], this.errorList = [], this.errorMap = {}, this.toShow = e([]), this.toHide = e([]), this.currentElements = e([])
    }, prepareForm: function () {
        this.reset(), this.toHide = this.errors().add(this.containers)
    }, prepareElement: function (e) {
        this.reset(), this.toHide = this.errorsFor(e)
    }, elementValue: function (t) {
        var n = e(t).attr("type"), i = e(t).val();
        return"radio" === n || "checkbox" === n ? e("input[name='" + e(t).attr("name") + "']:checked").val() : "string" == typeof i ? i.replace(/\r/g, "") : i
    }, check: function (t) {
        t = this.validationTargetFor(this.clean(t));
        var n, i = e(t).rules(), r = !1, o = this.elementValue(t);
        for (var a in i) {
            var s = {method: a, parameters: i[a]};
            try {
                if (n = e.validator.methods[a].call(this, o, t, s.parameters), "dependency-mismatch" === n) {
                    r = !0;
                    continue
                }
                if (r = !1, "pending" === n)return this.toHide = this.toHide.not(this.errorsFor(t)), void 0;
                if (!n)return this.formatAndAdd(t, s), !1
            } catch (l) {
                throw this.settings.debug && window.console && console.log("Exception occured when checking element " + t.id + ", check the '" + s.method + "' method.", l), l
            }
        }
        return r ? void 0 : (this.objectLength(i) && this.successList.push(t), !0)
    }, customDataMessage: function (t, n) {
        return e(t).data("msg-" + n.toLowerCase()) || t.attributes && e(t).attr("data-msg-" + n.toLowerCase())
    }, customMessage: function (e, t) {
        var n = this.settings.messages[e];
        return n && (n.constructor === String ? n : n[t])
    }, findDefined: function () {
        for (var e = 0; e < arguments.length; e++)if (void 0 !== arguments[e])return arguments[e];
        return void 0
    }, defaultMessage: function (t, n) {
        return this.findDefined(this.customMessage(t.name, n), this.customDataMessage(t, n), !this.settings.ignoreTitle && t.title || void 0, e.validator.messages[n], "<strong>Warning: No message defined for " + t.name + "</strong>")
    }, formatAndAdd: function (t, n) {
        var i = this.defaultMessage(t, n.method), r = /\$?\{(\d+)\}/g;
        "function" == typeof i ? i = i.call(this, n.parameters, t) : r.test(i) && (i = e.validator.format(i.replace(r, "{$1}"), n.parameters)), this.errorList.push({message: i, element: t}), this.errorMap[t.name] = i, this.submitted[t.name] = i
    }, addWrapper: function (e) {
        return this.settings.wrapper && (e = e.add(e.parent(this.settings.wrapper))), e
    }, defaultShowErrors: function () {
        var e, t;
        for (e = 0; this.errorList[e]; e++) {
            var n = this.errorList[e];
            this.settings.highlight && this.settings.highlight.call(this, n.element, this.settings.errorClass, this.settings.validClass), this.showLabel(n.element, n.message)
        }
        if (this.errorList.length && (this.toShow = this.toShow.add(this.containers)), this.settings.success)for (e = 0; this.successList[e]; e++)this.showLabel(this.successList[e]);
        if (this.settings.unhighlight)for (e = 0, t = this.validElements(); t[e]; e++)this.settings.unhighlight.call(this, t[e], this.settings.errorClass, this.settings.validClass);
        this.toHide = this.toHide.not(this.toShow), this.hideErrors(), this.addWrapper(this.toShow).show()
    }, validElements: function () {
        return this.currentElements.not(this.invalidElements())
    }, invalidElements: function () {
        return e(this.errorList).map(function () {
            return this.element
        })
    }, showLabel: function (t, n) {
        var i = this.errorsFor(t);
        i.length ? (i.removeClass(this.settings.validClass).addClass(this.settings.errorClass), i.attr("generated") && i.html(n)) : (i = e("<" + this.settings.errorElement + "/>").attr({"for": this.idOrName(t), generated: !0}).addClass(this.settings.errorClass).html(n || ""), this.settings.wrapper && (i = i.hide().show().wrap("<" + this.settings.wrapper + "/>").parent()), this.labelContainer.append(i).length || (this.settings.errorPlacement ? this.settings.errorPlacement(i, e(t)) : i.insertAfter(t))), !n && this.settings.success && (i.text(""), "string" == typeof this.settings.success ? i.addClass(this.settings.success) : this.settings.success(i, t)), this.toShow = this.toShow.add(i)
    }, errorsFor: function (t) {
        var n = this.idOrName(t);
        return this.errors().filter(function () {
            return e(this).attr("for") === n
        })
    }, idOrName: function (e) {
        return this.groups[e.name] || (this.checkable(e) ? e.name : e.id || e.name)
    }, validationTargetFor: function (e) {
        return this.checkable(e) && (e = this.findByName(e.name).not(this.settings.ignore)[0]), e
    }, checkable: function (e) {
        return/radio|checkbox/i.test(e.type)
    }, findByName: function (t) {
        return e(this.currentForm).find("[name='" + t + "']")
    }, getLength: function (t, n) {
        switch (n.nodeName.toLowerCase()) {
            case"select":
                return e("option:selected", n).length;
            case"input":
                if (this.checkable(n))return this.findByName(n.name).filter(":checked").length
        }
        return t.length
    }, depend: function (e, t) {
        return this.dependTypes[typeof e] ? this.dependTypes[typeof e](e, t) : !0
    }, dependTypes: {"boolean": function (e) {
        return e
    }, string: function (t, n) {
        return!!e(t, n.form).length
    }, "function": function (e, t) {
        return e(t)
    }}, optional: function (t) {
        var n = this.elementValue(t);
        return!e.validator.methods.required.call(this, n, t) && "dependency-mismatch"
    }, startRequest: function (e) {
        this.pending[e.name] || (this.pendingRequest++, this.pending[e.name] = !0)
    }, stopRequest: function (t, n) {
        this.pendingRequest--, this.pendingRequest < 0 && (this.pendingRequest = 0), delete this.pending[t.name], n && 0 === this.pendingRequest && this.formSubmitted && this.form() ? (e(this.currentForm).submit(), this.formSubmitted = !1) : !n && 0 === this.pendingRequest && this.formSubmitted && (e(this.currentForm).triggerHandler("invalid-form", [this]), this.formSubmitted = !1)
    }, previousValue: function (t) {
        return e.data(t, "previousValue") || e.data(t, "previousValue", {old: null, valid: !0, message: this.defaultMessage(t, "remote")})
    }}, classRuleSettings: {required: {required: !0}, email: {email: !0}, url: {url: !0}, date: {date: !0}, dateISO: {dateISO: !0}, number: {number: !0}, digits: {digits: !0}, creditcard: {creditcard: !0}}, addClassRules: function (t, n) {
        t.constructor === String ? this.classRuleSettings[t] = n : e.extend(this.classRuleSettings, t)
    }, classRules: function (t) {
        var n = {}, i = e(t).attr("class");
        return i && e.each(i.split(" "), function () {
            this in e.validator.classRuleSettings && e.extend(n, e.validator.classRuleSettings[this])
        }), n
    }, attributeRules: function (t) {
        var n = {}, i = e(t);
        for (var r in e.validator.methods) {
            var o;
            "required" === r ? (o = i.get(0).getAttribute(r), "" === o && (o = !0), o = !!o) : o = i.attr(r), o ? n[r] = o : i[0].getAttribute("type") === r && (n[r] = !0)
        }
        return n.maxlength && /-1|2147483647|524288/.test(n.maxlength) && delete n.maxlength, n
    }, dataRules: function (t) {
        var n, i, r = {}, o = e(t);
        for (n in e.validator.methods)i = o.data("rule-" + n.toLowerCase()), void 0 !== i && (r[n] = i);
        return r
    }, staticRules: function (t) {
        var n = {}, i = e.data(t.form, "validator");
        return i.settings.rules && (n = e.validator.normalizeRule(i.settings.rules[t.name]) || {}), n
    }, normalizeRules: function (t, n) {
        return e.each(t, function (i, r) {
            if (r === !1)return delete t[i], void 0;
            if (r.param || r.depends) {
                var o = !0;
                switch (typeof r.depends) {
                    case"string":
                        o = !!e(r.depends, n.form).length;
                        break;
                    case"function":
                        o = r.depends.call(n, n)
                }
                o ? t[i] = void 0 !== r.param ? r.param : !0 : delete t[i]
            }
        }), e.each(t, function (i, r) {
            t[i] = e.isFunction(r) ? r(n) : r
        }), e.each(["minlength", "maxlength", "min", "max"], function () {
            t[this] && (t[this] = Number(t[this]))
        }), e.each(["rangelength", "range"], function () {
            var n;
            t[this] && (e.isArray(t[this]) ? t[this] = [Number(t[this][0]), Number(t[this][1])] : "string" == typeof t[this] && (n = t[this].split(/[\s,]+/), t[this] = [Number(n[0]), Number(n[1])]))
        }), e.validator.autoCreateRanges && (t.min && t.max && (t.range = [t.min, t.max], delete t.min, delete t.max), t.minlength && t.maxlength && (t.rangelength = [t.minlength, t.maxlength], delete t.minlength, delete t.maxlength)), t
    }, normalizeRule: function (t) {
        if ("string" == typeof t) {
            var n = {};
            e.each(t.split(/\s/), function () {
                n[this] = !0
            }), t = n
        }
        return t
    }, addMethod: function (t, n, i) {
        e.validator.methods[t] = n, e.validator.messages[t] = void 0 !== i ? i : e.validator.messages[t], n.length < 3 && e.validator.addClassRules(t, e.validator.normalizeRule(t))
    }, methods: {required: function (t, n, i) {
        if (!this.depend(i, n))return"dependency-mismatch";
        if ("select" === n.nodeName.toLowerCase()) {
            var r = e(n).val();
            return r && r.length > 0
        }
        return this.checkable(n) ? this.getLength(t, n) > 0 : e.trim(t).length > 0
    }, remote: function (t, n, i) {
        if (this.optional(n))return"dependency-mismatch";
        var r = this.previousValue(n);
        if (this.settings.messages[n.name] || (this.settings.messages[n.name] = {}), r.originalMessage = this.settings.messages[n.name].remote, this.settings.messages[n.name].remote = r.message, i = "string" == typeof i && {url: i} || i, r.old === t)return r.valid;
        r.old = t;
        var o = this;
        this.startRequest(n);
        var a = {};
        return a[n.name] = t, e.ajax(e.extend(!0, {url: i, mode: "abort", port: "validate" + n.name, dataType: "json", data: a, success: function (i) {
            o.settings.messages[n.name].remote = r.originalMessage;
            var a = i === !0 || "true" === i;
            if (a) {
                var s = o.formSubmitted;
                o.prepareElement(n), o.formSubmitted = s, o.successList.push(n), delete o.invalid[n.name], o.showErrors()
            } else {
                var l = {}, u = i || o.defaultMessage(n, "remote");
                l[n.name] = r.message = e.isFunction(u) ? u(t) : u, o.invalid[n.name] = !0, o.showErrors(l)
            }
            r.valid = a, o.stopRequest(n, a)
        }}, i)), "pending"
    }, minlength: function (t, n, i) {
        var r = e.isArray(t) ? t.length : this.getLength(e.trim(t), n);
        return this.optional(n) || r >= i
    }, maxlength: function (t, n, i) {
        var r = e.isArray(t) ? t.length : this.getLength(e.trim(t), n);
        return this.optional(n) || i >= r
    }, rangelength: function (t, n, i) {
        var r = e.isArray(t) ? t.length : this.getLength(e.trim(t), n);
        return this.optional(n) || r >= i[0] && r <= i[1]
    }, min: function (e, t, n) {
        return this.optional(t) || e >= n
    }, max: function (e, t, n) {
        return this.optional(t) || n >= e
    }, range: function (e, t, n) {
        return this.optional(t) || e >= n[0] && e <= n[1]
    }, email: function (e, t) {
        return this.optional(t) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(e)
    }, url: function (e, t) {
        return this.optional(t) || /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(e)
    }, date: function (e, t) {
        return this.optional(t) || !/Invalid|NaN/.test(new Date(e).toString())
    }, dateISO: function (e, t) {
        return this.optional(t) || /^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}$/.test(e)
    }, number: function (e, t) {
        return this.optional(t) || /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test(e)
    }, digits: function (e, t) {
        return this.optional(t) || /^\d+$/.test(e)
    }, creditcard: function (e, t) {
        if (this.optional(t))return"dependency-mismatch";
        if (/[^0-9 \-]+/.test(e))return!1;
        var n = 0, i = 0, r = !1;
        e = e.replace(/\D/g, "");
        for (var o = e.length - 1; o >= 0; o--) {
            var a = e.charAt(o);
            i = parseInt(a, 10), r && (i *= 2) > 9 && (i -= 9), n += i, r = !r
        }
        return n % 10 === 0
    }, equalTo: function (t, n, i) {
        var r = e(i);
        return this.settings.onfocusout && r.unbind(".validate-equalTo").bind("blur.validate-equalTo", function () {
            e(n).valid()
        }), t === r.val()
    }}}), e.format = e.validator.format
}(jQuery), function (e) {
    var t = {};
    if (e.ajaxPrefilter)e.ajaxPrefilter(function (e, n, i) {
        var r = e.port;
        "abort" === e.mode && (t[r] && t[r].abort(), t[r] = i)
    }); else {
        var n = e.ajax;
        e.ajax = function (i) {
            var r = ("mode"in i ? i : e.ajaxSettings).mode, o = ("port"in i ? i : e.ajaxSettings).port;
            return"abort" === r ? (t[o] && t[o].abort(), t[o] = n.apply(this, arguments)) : n.apply(this, arguments)
        }
    }
}(jQuery), function (e) {
    e.extend(e.fn, {validateDelegate: function (t, n, i) {
        return this.bind(n, function (n) {
            var r = e(n.target);
            return r.is(t) ? i.apply(r, arguments) : void 0
        })
    }})
}(jQuery), define("jquery.validate", function () {
}), function (e) {
    var t = function () {
        return!1 === e.support.boxModel && e.support.objectAll && e.support.leadingWhitespace
    }();
    e.jGrowl = function (t, n) {
        0 == e("#jGrowl").size() && e('<div id="jGrowl"></div>').addClass(n && n.position ? n.position : e.jGrowl.defaults.position).appendTo("body"), e("#jGrowl").jGrowl(t, n)
    }, e.fn.jGrowl = function (t, n) {
        if (e.isFunction(this.each)) {
            var i = arguments;
            return this.each(function () {
                void 0 == e(this).data("jGrowl.instance") && (e(this).data("jGrowl.instance", e.extend(new e.fn.jGrowl, {notifications: [], element: null, interval: null})), e(this).data("jGrowl.instance").startup(this)), e.isFunction(e(this).data("jGrowl.instance")[t]) ? e(this).data("jGrowl.instance")[t].apply(e(this).data("jGrowl.instance"), e.makeArray(i).slice(1)) : e(this).data("jGrowl.instance").create(t, n)
            })
        }
    }, e.extend(e.fn.jGrowl.prototype, {defaults: {pool: 0, header: "", group: "", sticky: !1, position: "top-right", glue: "after", theme: "default", themeState: "highlight", corners: "10px", check: 250, life: 3e3, closeDuration: "normal", openDuration: "normal", easing: "swing", closer: !0, closeTemplate: "&times;", closerTemplate: "<div>[ close all ]</div>", log: function () {
    }, beforeOpen: function () {
    }, afterOpen: function () {
    }, open: function () {
    }, beforeClose: function () {
    }, close: function () {
    }, animateOpen: {opacity: "show"}, animateClose: {opacity: "hide"}}, notifications: [], element: null, interval: null, create: function (t, n) {
        var n = e.extend({}, this.defaults, n);
        void 0 !== n.speed && (n.openDuration = n.speed, n.closeDuration = n.speed), this.notifications.push({message: t, options: n}), n.log.apply(this.element, [this.element, t, n])
    }, render: function (t) {
        var n = this, i = t.message, r = t.options;
        r.themeState = "" == r.themeState ? "" : "ui-state-" + r.themeState;
        var t = e("<div/>").addClass("jGrowl-notification " + r.themeState + " ui-corner-all" + (void 0 != r.group && "" != r.group ? " " + r.group : "")).append(e("<div/>").addClass("jGrowl-close").html(r.closeTemplate)).append(e("<div/>").addClass("jGrowl-header").html(r.header)).append(e("<div/>").addClass("jGrowl-message").html(i)).data("jGrowl", r).addClass(r.theme).children("div.jGrowl-close").bind("click.jGrowl",function () {
            e(this).parent().trigger("jGrowl.beforeClose")
        }).parent();
        e(t).bind("mouseover.jGrowl",function () {
            e("div.jGrowl-notification", n.element).data("jGrowl.pause", !0)
        }).bind("mouseout.jGrowl",function () {
            e("div.jGrowl-notification", n.element).data("jGrowl.pause", !1)
        }).bind("jGrowl.beforeOpen",function () {
            r.beforeOpen.apply(t, [t, i, r, n.element]) !== !1 && e(this).trigger("jGrowl.open")
        }).bind("jGrowl.open",function () {
            r.open.apply(t, [t, i, r, n.element]) !== !1 && ("after" == r.glue ? e("div.jGrowl-notification:last", n.element).after(t) : e("div.jGrowl-notification:first", n.element).before(t), e(this).animate(r.animateOpen, r.openDuration, r.easing, function () {
                e.support.opacity === !1 && this.style.removeAttribute("filter"), null !== e(this).data("jGrowl") && (e(this).data("jGrowl").created = new Date), e(this).trigger("jGrowl.afterOpen")
            }))
        }).bind("jGrowl.afterOpen",function () {
            r.afterOpen.apply(t, [t, i, r, n.element])
        }).bind("jGrowl.beforeClose",function () {
            r.beforeClose.apply(t, [t, i, r, n.element]) !== !1 && e(this).trigger("jGrowl.close")
        }).bind("jGrowl.close",function () {
            e(this).data("jGrowl.pause", !0), e(this).animate(r.animateClose, r.closeDuration, r.easing, function () {
                e.isFunction(r.close) ? r.close.apply(t, [t, i, r, n.element]) !== !1 && e(this).remove() : e(this).remove()
            })
        }).trigger("jGrowl.beforeOpen"), "" != r.corners && void 0 != e.fn.corner && e(t).corner(r.corners), e("div.jGrowl-notification:parent", n.element).size() > 1 && 0 == e("div.jGrowl-closer", n.element).size() && this.defaults.closer !== !1 && e(this.defaults.closerTemplate).addClass("jGrowl-closer " + this.defaults.themeState + " ui-corner-all").addClass(this.defaults.theme).appendTo(n.element).animate(this.defaults.animateOpen, this.defaults.speed, this.defaults.easing).bind("click.jGrowl", function () {
            e(this).siblings().trigger("jGrowl.beforeClose"), e.isFunction(n.defaults.closer) && n.defaults.closer.apply(e(this).parent()[0], [e(this).parent()[0]])
        })
    }, update: function () {
        e(this.element).find("div.jGrowl-notification:parent").each(function () {
            void 0 != e(this).data("jGrowl") && void 0 !== e(this).data("jGrowl").created && e(this).data("jGrowl").created.getTime() + parseInt(e(this).data("jGrowl").life) < (new Date).getTime() && e(this).data("jGrowl").sticky !== !0 && (void 0 == e(this).data("jGrowl.pause") || e(this).data("jGrowl.pause") !== !0) && e(this).trigger("jGrowl.beforeClose")
        }), this.notifications.length > 0 && (0 == this.defaults.pool || e(this.element).find("div.jGrowl-notification:parent").size() < this.defaults.pool) && this.render(this.notifications.shift()), 2 > e(this.element).find("div.jGrowl-notification:parent").size() && e(this.element).find("div.jGrowl-closer").animate(this.defaults.animateClose, this.defaults.speed, this.defaults.easing, function () {
            e(this).remove()
        })
    }, startup: function (n) {
        this.element = e(n).addClass("jGrowl").append('<div class="jGrowl-notification"></div>'), this.interval = setInterval(function () {
            e(n).data("jGrowl.instance").update()
        }, parseInt(this.defaults.check)), t && e(this.element).addClass("ie6")
    }, shutdown: function () {
        e(this.element).removeClass("jGrowl").find("div.jGrowl-notification").trigger("jGrowl.close").parent().empty(), clearInterval(this.interval)
    }, close: function () {
        e(this.element).find("div.jGrowl-notification").each(function () {
            e(this).trigger("jGrowl.beforeClose")
        })
    }}), e.jGrowl.defaults = e.fn.jGrowl.prototype.defaults
}(jQuery), define("jquery.jgrowl", function () {
}), !function (e) {
    e(function () {
        e.support.transition = function () {
            var e = function () {
                var e, t = document.createElement("bootstrap"), n = {WebkitTransition: "webkitTransitionEnd", MozTransition: "transitionend", OTransition: "oTransitionEnd otransitionend", transition: "transitionend"};
                for (e in n)if (void 0 !== t.style[e])return n[e]
            }();
            return e && {end: e}
        }()
    })
}(window.jQuery), !function (e) {
    var t = function (t, n) {
        this.options = n, this.$element = e(t).delegate('[data-dismiss="modal"]', "click.dismiss.modal", e.proxy(this.hide, this)), this.options.remote && this.$element.find(".modal-body").load(this.options.remote)
    };
    t.prototype = {constructor: t, toggle: function () {
        return this[this.isShown ? "hide" : "show"]()
    }, show: function () {
        var t = this, n = e.Event("show");
        this.$element.trigger(n), this.isShown || n.isDefaultPrevented() || (this.isShown = !0, this.escape(), this.backdrop(function () {
            var n = e.support.transition && t.$element.hasClass("fade");
            t.$element.parent().length || t.$element.appendTo(document.body), t.$element.show(), n && t.$element[0].offsetWidth, t.$element.addClass("in").attr("aria-hidden", !1), t.enforceFocus(), n ? t.$element.one(e.support.transition.end, function () {
                t.$element.focus().trigger("shown")
            }) : t.$element.focus().trigger("shown")
        }))
    }, hide: function (t) {
        t && t.preventDefault();
        t = e.Event("hide"), this.$element.trigger(t), this.isShown && !t.isDefaultPrevented() && (this.isShown = !1, this.escape(), e(document).off("focusin.modal"), this.$element.removeClass("in").attr("aria-hidden", !0), e.support.transition && this.$element.hasClass("fade") ? this.hideWithTransition() : this.hideModal())
    }, enforceFocus: function () {
        var t = this;
        e(document).on("focusin.modal", function (e) {
            t.$element[0] === e.target || t.$element.has(e.target).length || t.$element.focus()
        })
    }, escape: function () {
        var e = this;
        this.isShown && this.options.keyboard ? this.$element.on("keyup.dismiss.modal", function (t) {
            27 == t.which && e.hide()
        }) : this.isShown || this.$element.off("keyup.dismiss.modal")
    }, hideWithTransition: function () {
        var t = this, n = setTimeout(function () {
            t.$element.off(e.support.transition.end), t.hideModal()
        }, 500);
        this.$element.one(e.support.transition.end, function () {
            clearTimeout(n), t.hideModal()
        })
    }, hideModal: function () {
        var e = this;
        this.$element.hide(), this.backdrop(function () {
            e.removeBackdrop(), e.$element.trigger("hidden")
        })
    }, removeBackdrop: function () {
        this.$backdrop && this.$backdrop.remove(), this.$backdrop = null
    }, backdrop: function (t) {
        var n = this.$element.hasClass("fade") ? "fade" : "";
        if (this.isShown && this.options.backdrop) {
            var i = e.support.transition && n;
            if (this.$backdrop = e('<div class="modal-backdrop ' + n + '" />').appendTo(document.body), this.$backdrop.click("static" == this.options.backdrop ? e.proxy(this.$element[0].focus, this.$element[0]) : e.proxy(this.hide, this)), i && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !t)return;
            i ? this.$backdrop.one(e.support.transition.end, t) : t()
        } else!this.isShown && this.$backdrop ? (this.$backdrop.removeClass("in"), e.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one(e.support.transition.end, t) : t()) : t && t()
    }};
    var n = e.fn.modal;
    e.fn.modal = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("modal"), o = e.extend({}, e.fn.modal.defaults, i.data(), "object" == typeof n && n);
            r || i.data("modal", r = new t(this, o)), "string" == typeof n ? r[n]() : o.show && r.show()
        })
    }, e.fn.modal.defaults = {backdrop: !0, keyboard: !0, show: !0}, e.fn.modal.Constructor = t, e.fn.modal.noConflict = function () {
        return e.fn.modal = n, this
    }, e(document).on("click.modal.data-api", '[data-toggle="modal"]', function (t) {
        var n = e(this), i = n.attr("href"), r = e(n.attr("data-target") || i && i.replace(/.*(?=#[^\s]+$)/, "")), o = r.data("modal") ? "toggle" : e.extend({remote: !/#/.test(i) && i}, r.data(), n.data());
        t.preventDefault(), r.modal(o).one("hide", function () {
            n.focus()
        })
    })
}(window.jQuery), !function (e) {
    function t() {
        e(".dropdown-backdrop").remove(), e(i).each(function () {
            n(e(this)).removeClass("open")
        })
    }

    function n(t) {
        var n, i = t.attr("data-target");
        return i || (i = t.attr("href"), i = i && /#/.test(i) && i.replace(/.*(?=#[^\s]*$)/, "")), n = i && e(i), n && n.length || (n = t.parent()), n
    }

    var i = "[data-toggle=dropdown]", r = function (t) {
        var n = e(t).on("click.dropdown.data-api", this.toggle);
        e("html").on("click.dropdown.data-api", function () {
            n.parent().removeClass("open")
        })
    };
    r.prototype = {constructor: r, toggle: function () {
        var i, r, o = e(this);
        if (!o.is(".disabled, :disabled"))return i = n(o), r = i.hasClass("open"), t(), r || ("ontouchstart"in document.documentElement && e('<div class="dropdown-backdrop"/>').insertBefore(e(this)).on("click", t), i.toggleClass("open")), o.focus(), !1
    }, keydown: function (t) {
        var r, o, a, s, l;
        if (/(38|40|27)/.test(t.keyCode) && (r = e(this), t.preventDefault(), t.stopPropagation(), !r.is(".disabled, :disabled"))) {
            if (a = n(r), s = a.hasClass("open"), !s || s && 27 == t.keyCode)return 27 == t.which && a.find(i).focus(), r.click();
            o = e("[role=menu] li:not(.divider):visible a", a), o.length && (l = o.index(o.filter(":focus")), 38 == t.keyCode && l > 0 && l--, 40 == t.keyCode && l < o.length - 1 && l++, ~l || (l = 0), o.eq(l).focus())
        }
    }};
    var o = e.fn.dropdown;
    e.fn.dropdown = function (t) {
        return this.each(function () {
            var n = e(this), i = n.data("dropdown");
            i || n.data("dropdown", i = new r(this)), "string" == typeof t && i[t].call(n)
        })
    }, e.fn.dropdown.Constructor = r, e.fn.dropdown.noConflict = function () {
        return e.fn.dropdown = o, this
    }, e(document).on("click.dropdown.data-api", t).on("click.dropdown.data-api", ".dropdown form",function (e) {
        e.stopPropagation()
    }).on("click.dropdown.data-api", i, r.prototype.toggle).on("keydown.dropdown.data-api", i + ", [role=menu]", r.prototype.keydown)
}(window.jQuery), !function (e) {
    function t(t, n) {
        var i, r = e.proxy(this.process, this), o = e(t).is("body") ? e(window) : e(t);
        this.options = e.extend({}, e.fn.scrollspy.defaults, n), this.$scrollElement = o.on("scroll.scroll-spy.data-api", r), this.selector = (this.options.target || (i = e(t).attr("href")) && i.replace(/.*(?=#[^\s]+$)/, "") || "") + " .nav li > a", this.$body = e("body"), this.refresh(), this.process()
    }

    t.prototype = {constructor: t, refresh: function () {
        var t, n = this;
        this.offsets = e([]), this.targets = e([]), t = this.$body.find(this.selector).map(function () {
            var t = e(this), i = t.data("target") || t.attr("href"), r = /^#\w/.test(i) && e(i);
            return r && r.length && [
                [r.position().top + (!e.isWindow(n.$scrollElement.get(0)) && n.$scrollElement.scrollTop()), i]
            ] || null
        }).sort(function (e, t) {
            return e[0] - t[0]
        }).each(function () {
            n.offsets.push(this[0]), n.targets.push(this[1])
        })
    }, process: function () {
        var e, t = this.$scrollElement.scrollTop() + this.options.offset, n = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight, i = n - this.$scrollElement.height(), r = this.offsets, o = this.targets, a = this.activeTarget;
        if (t >= i)return a != (e = o.last()[0]) && this.activate(e);
        for (e = r.length; e--;)a != o[e] && t >= r[e] && (!r[e + 1] || t <= r[e + 1]) && this.activate(o[e])
    }, activate: function (t) {
        var n, i;
        this.activeTarget = t, e(this.selector).parent(".active").removeClass("active"), i = this.selector + '[data-target="' + t + '"],' + this.selector + '[href="' + t + '"]', n = e(i).parent("li").addClass("active"), n.parent(".dropdown-menu").length && (n = n.closest("li.dropdown").addClass("active")), n.trigger("activate")
    }};
    var n = e.fn.scrollspy;
    e.fn.scrollspy = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("scrollspy"), o = "object" == typeof n && n;
            r || i.data("scrollspy", r = new t(this, o)), "string" == typeof n && r[n]()
        })
    }, e.fn.scrollspy.Constructor = t, e.fn.scrollspy.defaults = {offset: 10}, e.fn.scrollspy.noConflict = function () {
        return e.fn.scrollspy = n, this
    }, e(window).on("load", function () {
        e('[data-spy="scroll"]').each(function () {
            var t = e(this);
            t.scrollspy(t.data())
        })
    })
}(window.jQuery), !function (e) {
    var t = function (t) {
        this.element = e(t)
    };
    t.prototype = {constructor: t, show: function () {
        var t, n, i, r = this.element, o = r.closest("ul:not(.dropdown-menu)"), a = r.attr("data-target");
        a || (a = r.attr("href"), a = a && a.replace(/.*(?=#[^\s]*$)/, "")), r.parent("li").hasClass("active") || (t = o.find(".active:last a")[0], i = e.Event("show", {relatedTarget: t}), r.trigger(i), i.isDefaultPrevented() || (n = e(a), this.activate(r.parent("li"), o), this.activate(n, n.parent(), function () {
            r.trigger({type: "shown", relatedTarget: t})
        })))
    }, activate: function (t, n, i) {
        function r() {
            o.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"), t.addClass("active"), a ? (t[0].offsetWidth, t.addClass("in")) : t.removeClass("fade"), t.parent(".dropdown-menu") && t.closest("li.dropdown").addClass("active"), i && i()
        }

        var o = n.find("> .active"), a = i && e.support.transition && o.hasClass("fade");
        a ? o.one(e.support.transition.end, r) : r(), o.removeClass("in")
    }};
    var n = e.fn.tab;
    e.fn.tab = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("tab");
            r || i.data("tab", r = new t(this)), "string" == typeof n && r[n]()
        })
    }, e.fn.tab.Constructor = t, e.fn.tab.noConflict = function () {
        return e.fn.tab = n, this
    }, e(document).on("click.tab.data-api", '[data-toggle="tab"], [data-toggle="pill"]', function (t) {
        t.preventDefault(), e(this).tab("show")
    })
}(window.jQuery), !function (e) {
    var t = function (e, t) {
        this.init("tooltip", e, t)
    };
    t.prototype = {constructor: t, init: function (t, n, i) {
        var r, o, a, s, l;
        for (this.type = t, this.$element = e(n), this.options = this.getOptions(i), this.enabled = !0, a = this.options.trigger.split(" "), l = a.length; l--;)s = a[l], "click" == s ? this.$element.on("click." + this.type, this.options.selector, e.proxy(this.toggle, this)) : "manual" != s && (r = "hover" == s ? "mouseenter" : "focus", o = "hover" == s ? "mouseleave" : "blur", this.$element.on(r + "." + this.type, this.options.selector, e.proxy(this.enter, this)), this.$element.on(o + "." + this.type, this.options.selector, e.proxy(this.leave, this)));
        this.options.selector ? this._options = e.extend({}, this.options, {trigger: "manual", selector: ""}) : this.fixTitle()
    }, getOptions: function (t) {
        return t = e.extend({}, e.fn[this.type].defaults, this.$element.data(), t, {html: !0}), t.delay && "number" == typeof t.delay && (t.delay = {show: t.delay, hide: t.delay}), t
    }, enter: function (t) {
        var n, i = e.fn[this.type].defaults, r = {};
        return this._options && e.each(this._options, function (e, t) {
            i[e] != t && (r[e] = t)
        }, this), n = e(t.currentTarget)[this.type](r).data(this.type), n.options.delay && n.options.delay.show ? (clearTimeout(this.timeout), n.hoverState = "in", this.timeout = setTimeout(function () {
            "in" == n.hoverState && n.show()
        }, n.options.delay.show), void 0) : n.show()
    }, leave: function (t) {
        var n = e(t.currentTarget)[this.type](this._options).data(this.type);
        return this.timeout && clearTimeout(this.timeout), n.options.delay && n.options.delay.hide ? (n.hoverState = "out", this.timeout = setTimeout(function () {
            "out" == n.hoverState && n.hide()
        }, n.options.delay.hide), void 0) : n.hide()
    }, show: function () {
        var t, n, i, r, o, a, s = e.Event("show");
        if (this.hasContent() && this.enabled) {
            if (this.$element.trigger(s), s.isDefaultPrevented())return;
            switch (t = this.tip(), this.setContent(), this.options.animation && t.addClass("fade"), o = "function" == typeof this.options.placement ? this.options.placement.call(this, t[0], this.$element[0]) : this.options.placement, t.detach().css({top: 0, left: 0, display: "block"}), this.options.container ? t.appendTo(this.options.container) : t.insertAfter(this.$element), n = this.getPosition(), i = t[0].offsetWidth, r = t[0].offsetHeight, o) {
                case"bottom":
                    a = {top: n.top + n.height, left: n.left + n.width / 2 - i / 2};
                    break;
                case"top":
                    a = {top: n.top - r, left: n.left + n.width / 2 - i / 2};
                    break;
                case"left":
                    a = {top: n.top + n.height / 2 - r / 2, left: n.left - i};
                    break;
                case"right":
                    a = {top: n.top + n.height / 2 - r / 2, left: n.left + n.width}
            }
            this.applyPlacement(a, o), this.$element.trigger("shown")
        }
    }, applyPlacement: function (e, t) {
        var n, i, r, o, a = this.tip(), s = a[0].offsetWidth, l = a[0].offsetHeight;
        a.offset(e).addClass(t).addClass("in"), n = a[0].offsetWidth, i = a[0].offsetHeight, "top" == t && i != l && (e.top = e.top + l - i, o = !0), "bottom" == t || "top" == t ? (r = 0, e.left < 0 && (r = -2 * e.left, e.left = 0, a.offset(e), n = a[0].offsetWidth, i = a[0].offsetHeight), this.replaceArrow(r - s + n, n, "left")) : this.replaceArrow(i - l, i, "top"), o && a.offset(e)
    }, replaceArrow: function (e, t, n) {
        this.arrow().css(n, e ? 50 * (1 - e / t) + "%" : "")
    }, setContent: function () {
        var e = this.tip(), t = this.getTitle();
        e.find(".tooltip-inner")[this.options.html ? "html" : "text"](t), e.removeClass("fade in top bottom left right")
    }, hide: function () {
        function t() {
            var t = setTimeout(function () {
                n.off(e.support.transition.end).detach()
            }, 500);
            n.one(e.support.transition.end, function () {
                clearTimeout(t), n.detach()
            })
        }

        var n = this.tip(), i = e.Event("hide");
        return this.$element.trigger(i), i.isDefaultPrevented() ? void 0 : (n.removeClass("in"), e.support.transition && this.$tip.hasClass("fade") ? t() : n.detach(), this.$element.trigger("hidden"), this)
    }, fixTitle: function () {
        var e = this.$element;
        (e.attr("title") || "string" != typeof e.attr("data-original-title")) && e.attr("data-original-title", e.attr("title") || "").attr("title", "")
    }, hasContent: function () {
        return this.getTitle()
    }, getPosition: function () {
        var t = this.$element[0];
        return e.extend({}, "function" == typeof t.getBoundingClientRect ? t.getBoundingClientRect() : {width: t.offsetWidth, height: t.offsetHeight}, this.$element.offset())
    }, getTitle: function () {
        var e, t = this.$element, n = this.options;
        return e = t.attr("data-original-title") || ("function" == typeof n.title ? n.title.call(t[0]) : n.title)
    }, tip: function () {
        return this.$tip = this.$tip || e(this.options.template)
    }, arrow: function () {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    }, validate: function () {
        this.$element[0].parentNode || (this.hide(), this.$element = null, this.options = null)
    }, enable: function () {
        this.enabled = !0
    }, disable: function () {
        this.enabled = !1
    }, toggleEnabled: function () {
        this.enabled = !this.enabled
    }, toggle: function (t) {
        var n = t ? e(t.currentTarget)[this.type](this._options).data(this.type) : this;
        n.tip().hasClass("in") ? n.hide() : n.show()
    }, destroy: function () {
        this.hide().$element.off("." + this.type).removeData(this.type)
    }};
    var n = e.fn.tooltip;
    e.fn.tooltip = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("tooltip"), o = "object" == typeof n && n;
            r || i.data("tooltip", r = new t(this, o)), "string" == typeof n && r[n]()
        })
    }, e.fn.tooltip.Constructor = t, e.fn.tooltip.defaults = {animation: !0, placement: "top", selector: !1, template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>', trigger: "hover focus", title: "", delay: 0, html: !1, container: !1}, e.fn.tooltip.noConflict = function () {
        return e.fn.tooltip = n, this
    }
}(window.jQuery), !function (e) {
    var t = function (e, t) {
        this.init("popover", e, t)
    };
    t.prototype = e.extend({}, e.fn.tooltip.Constructor.prototype, {constructor: t, setContent: function () {
        var e = this.tip(), t = this.getTitle(), n = this.getContent();
        e.find(".popover-title")[this.options.html ? "html" : "text"](t), e.find(".popover-content")[this.options.html ? "html" : "text"](n), e.removeClass("fade top bottom left right in")
    }, hasContent: function () {
        return this.getTitle() || this.getContent()
    }, getContent: function () {
        var e, t = this.$element, n = this.options;
        return e = ("function" == typeof n.content ? n.content.call(t[0]) : n.content) || t.attr("data-content")
    }, tip: function () {
        return this.$tip || (this.$tip = e(this.options.template)), this.$tip
    }, destroy: function () {
        this.hide().$element.off("." + this.type).removeData(this.type)
    }});
    var n = e.fn.popover;
    e.fn.popover = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("popover"), o = "object" == typeof n && n;
            r || i.data("popover", r = new t(this, o)), "string" == typeof n && r[n]()
        })
    }, e.fn.popover.Constructor = t, e.fn.popover.defaults = e.extend({}, e.fn.tooltip.defaults, {placement: "right", trigger: "click", content: "", template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}), e.fn.popover.noConflict = function () {
        return e.fn.popover = n, this
    }
}(window.jQuery), !function (e) {
    var t = function (t, n) {
        this.options = e.extend({}, e.fn.affix.defaults, n), this.$window = e(window).on("scroll.affix.data-api", e.proxy(this.checkPosition, this)).on("click.affix.data-api", e.proxy(function () {
            setTimeout(e.proxy(this.checkPosition, this), 1)
        }, this)), this.$element = e(t), this.checkPosition()
    };
    t.prototype.checkPosition = function () {
        if (this.$element.is(":visible")) {
            var t, n = e(document).height(), i = this.$window.scrollTop(), r = this.$element.offset(), o = this.options.offset, a = o.bottom, s = o.top, l = "affix affix-top affix-bottom";
            "object" != typeof o && (a = s = o), "function" == typeof s && (s = o.top()), "function" == typeof a && (a = o.bottom()), t = null != this.unpin && i + this.unpin <= r.top ? !1 : null != a && r.top + this.$element.height() >= n - a ? "bottom" : null != s && s >= i ? "top" : !1, this.affixed !== t && (this.affixed = t, this.unpin = "bottom" == t ? r.top - i : null, this.$element.removeClass(l).addClass("affix" + (t ? "-" + t : "")))
        }
    };
    var n = e.fn.affix;
    e.fn.affix = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("affix"), o = "object" == typeof n && n;
            r || i.data("affix", r = new t(this, o)), "string" == typeof n && r[n]()
        })
    }, e.fn.affix.Constructor = t, e.fn.affix.defaults = {offset: 0}, e.fn.affix.noConflict = function () {
        return e.fn.affix = n, this
    }, e(window).on("load", function () {
        e('[data-spy="affix"]').each(function () {
            var t = e(this), n = t.data();
            n.offset = n.offset || {}, n.offsetBottom && (n.offset.bottom = n.offsetBottom), n.offsetTop && (n.offset.top = n.offsetTop), t.affix(n)
        })
    })
}(window.jQuery), !function (e) {
    var t = '[data-dismiss="alert"]', n = function (n) {
        e(n).on("click", t, this.close)
    };
    n.prototype.close = function (t) {
        function n() {
            i.trigger("closed").hide()
        }

        var i, r = e(this), o = r.attr("data-target");
        o || (o = r.attr("href"), o = o && o.replace(/.*(?=#[^\s]*$)/, "")), i = e(o), t && t.preventDefault(), i.length || (i = r.hasClass("alert") ? r : r.parent()), i.trigger(t = e.Event("close")), t.isDefaultPrevented() || (i.removeClass("in"), e.support.transition && i.hasClass("fade") ? i.on(e.support.transition.end, n) : n())
    };
    var i = e.fn.alert;
    e.fn.alert = function (t) {
        return this.each(function () {
            var i = e(this), r = i.data("alert");
            r || i.data("alert", r = new n(this)), "string" == typeof t && r[t].call(i)
        })
    }, e.fn.alert.Constructor = n, e.fn.alert.noConflict = function () {
        return e.fn.alert = i, this
    }, e(document).on("click.alert.data-api", t, n.prototype.close)
}(window.jQuery), !function (e) {
    var t = function (t, n) {
        this.$element = e(t), this.options = e.extend({}, e.fn.button.defaults, n)
    };
    t.prototype.setState = function (e) {
        var t = "disabled", n = this.$element, i = n.data(), r = n.is("input") ? "val" : "html";
        e += "Text", i.resetText || n.data("resetText", n[r]()), n[r](i[e] || this.options[e]), setTimeout(function () {
            "loadingText" == e ? n.addClass(t).attr(t, t) : n.removeClass(t).removeAttr(t)
        }, 0)
    }, t.prototype.toggle = function () {
        var e = this.$element.closest('[data-toggle="buttons-radio"]');
        e && e.find(".active").removeClass("active"), this.$element.toggleClass("active")
    };
    var n = e.fn.button;
    e.fn.button = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("button"), o = "object" == typeof n && n;
            r || i.data("button", r = new t(this, o)), "toggle" == n ? r.toggle() : n && r.setState(n)
        })
    }, e.fn.button.defaults = {loadingText: "loading..."}, e.fn.button.Constructor = t, e.fn.button.noConflict = function () {
        return e.fn.button = n, this
    }, e(document).on("click.button.data-api", "[data-toggle^=button]", function (t) {
        var n = e(t.target);
        n.hasClass("btn") || (n = n.closest(".btn")), n.button("toggle")
    })
}(window.jQuery), !function (e) {
    var t = function (t, n) {
        this.$element = e(t), this.options = e.extend({}, e.fn.collapse.defaults, n), this.options.parent && (this.$parent = e(this.options.parent)), this.options.toggle && this.toggle()
    };
    t.prototype = {constructor: t, dimension: function () {
        var e = this.$element.hasClass("width");
        return e ? "width" : "height"
    }, show: function () {
        var t, n, i, r;
        if (!this.transitioning && !this.$element.hasClass("in")) {
            if (t = this.dimension(), n = e.camelCase(["scroll", t].join("-")), i = this.$parent && this.$parent.find("> .accordion-group > .in"), i && i.length) {
                if (r = i.data("collapse"), r && r.transitioning)return;
                i.collapse("hide"), r || i.data("collapse", null)
            }
            this.$element[t](0), this.transition("addClass", e.Event("show"), "shown"), e.support.transition && this.$element[t](this.$element[0][n])
        }
    }, hide: function () {
        var t;
        !this.transitioning && this.$element.hasClass("in") && (t = this.dimension(), this.reset(this.$element[t]()), this.transition("removeClass", e.Event("hide"), "hidden"), this.$element[t](0))
    }, reset: function (e) {
        var t = this.dimension();
        return this.$element.removeClass("collapse")[t](e || "auto")[0].offsetWidth, this.$element[null !== e ? "addClass" : "removeClass"]("collapse"), this
    }, transition: function (t, n, i) {
        var r = this, o = function () {
            "show" == n.type && r.reset(), r.transitioning = 0, r.$element.trigger(i)
        };
        this.$element.trigger(n), n.isDefaultPrevented() || (this.transitioning = 1, this.$element[t]("in"), e.support.transition && this.$element.hasClass("collapse") ? this.$element.one(e.support.transition.end, o) : o())
    }, toggle: function () {
        this[this.$element.hasClass("in") ? "hide" : "show"]()
    }};
    var n = e.fn.collapse;
    e.fn.collapse = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("collapse"), o = e.extend({}, e.fn.collapse.defaults, i.data(), "object" == typeof n && n);
            r || i.data("collapse", r = new t(this, o)), "string" == typeof n && r[n]()
        })
    }, e.fn.collapse.defaults = {toggle: !0}, e.fn.collapse.Constructor = t, e.fn.collapse.noConflict = function () {
        return e.fn.collapse = n, this
    }, e(document).on("click.collapse.data-api", "[data-toggle=collapse]", function (t) {
        var n, i = e(this), r = i.attr("data-target") || t.preventDefault() || (n = i.attr("href")) && n.replace(/.*(?=#[^\s]+$)/, ""), o = e(r).data("collapse") ? "toggle" : i.data();
        i[e(r).hasClass("in") ? "addClass" : "removeClass"]("collapsed"), e(r).collapse(o)
    })
}(window.jQuery), !function (e) {
    var t = function (t, n) {
        this.$element = e(t), this.$indicators = this.$element.find(".carousel-indicators"), this.options = n, "hover" == this.options.pause && this.$element.on("mouseenter", e.proxy(this.pause, this)).on("mouseleave", e.proxy(this.cycle, this))
    };
    t.prototype = {cycle: function (t) {
        return t || (this.paused = !1), this.interval && clearInterval(this.interval), this.options.interval && !this.paused && (this.interval = setInterval(e.proxy(this.next, this), this.options.interval)), this
    }, getActiveIndex: function () {
        return this.$active = this.$element.find(".item.active"), this.$items = this.$active.parent().children(), this.$items.index(this.$active)
    }, to: function (t) {
        var n = this.getActiveIndex(), i = this;
        if (!(t > this.$items.length - 1 || 0 > t))return this.sliding ? this.$element.one("slid", function () {
            i.to(t)
        }) : n == t ? this.pause().cycle() : this.slide(t > n ? "next" : "prev", e(this.$items[t]))
    }, pause: function (t) {
        return t || (this.paused = !0), this.$element.find(".next, .prev").length && e.support.transition.end && (this.$element.trigger(e.support.transition.end), this.cycle(!0)), clearInterval(this.interval), this.interval = null, this
    }, next: function () {
        return this.sliding ? void 0 : this.slide("next")
    }, prev: function () {
        return this.sliding ? void 0 : this.slide("prev")
    }, slide: function (t, n) {
        var i, r = this.$element.find(".item.active"), o = n || r[t](), a = this.interval, s = "next" == t ? "left" : "right", l = "next" == t ? "first" : "last", u = this;
        if (this.sliding = !0, a && this.pause(), o = o.length ? o : this.$element.find(".item")[l](), i = e.Event("slide", {relatedTarget: o[0], direction: s}), !o.hasClass("active")) {
            if (this.$indicators.length && (this.$indicators.find(".active").removeClass("active"), this.$element.one("slid", function () {
                var t = e(u.$indicators.children()[u.getActiveIndex()]);
                t && t.addClass("active")
            })), e.support.transition && this.$element.hasClass("slide")) {
                if (this.$element.trigger(i), i.isDefaultPrevented())return;
                o.addClass(t), o[0].offsetWidth, r.addClass(s), o.addClass(s), this.$element.one(e.support.transition.end, function () {
                    o.removeClass([t, s].join(" ")).addClass("active"), r.removeClass(["active", s].join(" ")), u.sliding = !1, setTimeout(function () {
                        u.$element.trigger("slid")
                    }, 0)
                })
            } else {
                if (this.$element.trigger(i), i.isDefaultPrevented())return;
                r.removeClass("active"), o.addClass("active"), this.sliding = !1, this.$element.trigger("slid")
            }
            return a && this.cycle(), this
        }
    }};
    var n = e.fn.carousel;
    e.fn.carousel = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("carousel"), o = e.extend({}, e.fn.carousel.defaults, "object" == typeof n && n), a = "string" == typeof n ? n : o.slide;
            r || i.data("carousel", r = new t(this, o)), "number" == typeof n ? r.to(n) : a ? r[a]() : o.interval && r.pause().cycle()
        })
    }, e.fn.carousel.defaults = {interval: 5e3, pause: "hover"}, e.fn.carousel.Constructor = t, e.fn.carousel.noConflict = function () {
        return e.fn.carousel = n, this
    }, e(document).on("click.carousel.data-api", "[data-slide], [data-slide-to]", function (t) {
        var n, i, r = e(this), o = e(r.attr("data-target") || (n = r.attr("href")) && n.replace(/.*(?=#[^\s]+$)/, "")), a = e.extend({}, o.data(), r.data());
        o.carousel(a), (i = r.attr("data-slide-to")) && o.data("carousel").pause().to(i).cycle(), t.preventDefault()
    })
}(window.jQuery), !function (e) {
    var t = function (t, n) {
        this.$element = e(t), this.options = e.extend({}, e.fn.typeahead.defaults, n), this.matcher = this.options.matcher || this.matcher, this.sorter = this.options.sorter || this.sorter, this.highlighter = this.options.highlighter || this.highlighter, this.updater = this.options.updater || this.updater, this.source = this.options.source, this.$menu = e(this.options.menu), this.shown = !1, this.listen()
    };
    t.prototype = {constructor: t, select: function () {
        var e = this.$menu.find(".active").attr("data-value");
        return this.$element.val(this.updater(e)).change(), this.hide()
    }, updater: function (e) {
        return e
    }, show: function () {
        var t = e.extend({}, this.$element.position(), {height: this.$element[0].offsetHeight});
        return this.$menu.insertAfter(this.$element).css({top: t.top + t.height, left: t.left}).show(), this.shown = !0, this
    }, hide: function () {
        return this.$menu.hide(), this.shown = !1, this
    }, lookup: function () {
        var t;
        return this.query = this.$element.val(), !this.query || this.query.length < this.options.minLength ? this.shown ? this.hide() : this : (t = e.isFunction(this.source) ? this.source(this.query, e.proxy(this.process, this)) : this.source, t ? this.process(t) : this)
    }, process: function (t) {
        var n = this;
        return t = e.grep(t, function (e) {
            return n.matcher(e)
        }), t = this.sorter(t), t.length ? this.render(t.slice(0, this.options.items)).show() : this.shown ? this.hide() : this
    }, matcher: function (e) {
        return~e.toLowerCase().indexOf(this.query.toLowerCase())
    }, sorter: function (e) {
        for (var t, n = [], i = [], r = []; t = e.shift();)t.toLowerCase().indexOf(this.query.toLowerCase()) ? ~t.indexOf(this.query) ? i.push(t) : r.push(t) : n.push(t);
        return n.concat(i, r)
    }, highlighter: function (e) {
        var t = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&");
        return e.replace(new RegExp("(" + t + ")", "ig"), function (e, t) {
            return"<strong>" + t + "</strong>"
        })
    }, render: function (t) {
        var n = this;
        return t = e(t).map(function (t, i) {
            return t = e(n.options.item).attr("data-value", i), t.find("a").html(n.highlighter(i)), t[0]
        }), t.first().addClass("active"), this.$menu.html(t), this
    }, next: function () {
        var t = this.$menu.find(".active").removeClass("active"), n = t.next();
        n.length || (n = e(this.$menu.find("li")[0])), n.addClass("active")
    }, prev: function () {
        var e = this.$menu.find(".active").removeClass("active"), t = e.prev();
        t.length || (t = this.$menu.find("li").last()), t.addClass("active")
    }, listen: function () {
        this.$element.on("focus", e.proxy(this.focus, this)).on("blur", e.proxy(this.blur, this)).on("keypress", e.proxy(this.keypress, this)).on("keyup", e.proxy(this.keyup, this)), this.eventSupported("keydown") && this.$element.on("keydown", e.proxy(this.keydown, this)), this.$menu.on("click", e.proxy(this.click, this)).on("mouseenter", "li", e.proxy(this.mouseenter, this)).on("mouseleave", "li", e.proxy(this.mouseleave, this))
    }, eventSupported: function (e) {
        var t = e in this.$element;
        return t || (this.$element.setAttribute(e, "return;"), t = "function" == typeof this.$element[e]), t
    }, move: function (e) {
        if (this.shown) {
            switch (e.keyCode) {
                case 9:
                case 13:
                case 27:
                    e.preventDefault();
                    break;
                case 38:
                    e.preventDefault(), this.prev();
                    break;
                case 40:
                    e.preventDefault(), this.next()
            }
            e.stopPropagation()
        }
    }, keydown: function (t) {
        this.suppressKeyPressRepeat = ~e.inArray(t.keyCode, [40, 38, 9, 13, 27]), this.move(t)
    }, keypress: function (e) {
        this.suppressKeyPressRepeat || this.move(e)
    }, keyup: function (e) {
        switch (e.keyCode) {
            case 40:
            case 38:
            case 16:
            case 17:
            case 18:
                break;
            case 9:
            case 13:
                if (!this.shown)return;
                this.select();
                break;
            case 27:
                if (!this.shown)return;
                this.hide();
                break;
            default:
                this.lookup()
        }
        e.stopPropagation(), e.preventDefault()
    }, focus: function () {
        this.focused = !0
    }, blur: function () {
        this.focused = !1, !this.mousedover && this.shown && this.hide()
    }, click: function (e) {
        e.stopPropagation(), e.preventDefault(), this.select(), this.$element.focus()
    }, mouseenter: function (t) {
        this.mousedover = !0, this.$menu.find(".active").removeClass("active"), e(t.currentTarget).addClass("active")
    }, mouseleave: function () {
        this.mousedover = !1, !this.focused && this.shown && this.hide()
    }};
    var n = e.fn.typeahead;
    e.fn.typeahead = function (n) {
        return this.each(function () {
            var i = e(this), r = i.data("typeahead"), o = "object" == typeof n && n;
            r || i.data("typeahead", r = new t(this, o)), "string" == typeof n && r[n]()
        })
    }, e.fn.typeahead.defaults = {source: [], items: 8, menu: '<ul class="typeahead dropdown-menu"></ul>', item: '<li><a href="#"></a></li>', minLength: 1}, e.fn.typeahead.Constructor = t, e.fn.typeahead.noConflict = function () {
        return e.fn.typeahead = n, this
    }, e(document).on("focus.typeahead.data-api", '[data-provide="typeahead"]', function () {
        var t = e(this);
        t.data("typeahead") || t.typeahead(t.data())
    })
}(window.jQuery), define("bootstrap", function () {
}), require.config({paths: {moment: "moment.min", underscore: "underscore-min", jquery: "jquery-1.10.2.min", "jquery.jgrowl": "jquery.jgrowl.min", qrcode: "qrcode.min"}, shim: {underscore: {exports: "_"}, "jquery.validate": ["jquery"], "jquery.jgrowl": ["jquery"], bootstrap: ["jquery"]}}), require(["moment", "underscore", "jquery", "avltree", "goog!visualization,1.1,packages:[corechart,controls]", "jquery.validate", "jquery.jgrowl", "bootstrap"], function (e, t, n, i) {
    function r(e) {
        return document.getElementById(e)
    }

    function o(e, t) {
        return e[0] < t[0] ? -1 : e[0] > t[0] ? 1 : 0
    }

    function a(e, t, n) {
        var i = 1e8, r = Math.floor(e * i);
        if ((!n || isNaN(n)) && (n = 0), 0 == t)return 0;
        var o = Math.max(Math.floor(r / t) - Math.floor(r * n / 100 / t), 0), a = Math.ceil(o * t) + Math.ceil(o * t * n / 100);
        return a > r && (o = Math.max(Math.floor(o - Math.ceil(1 / t) * (1 + n / 100)), 0)), (o / i).toFixed(8)
    }

    var s = null;
    HTMLElement.prototype._innerText = function () {
        for (var e = this.lastChild, t = ""; 3 != e.nodeType && !e.isSameNode(this.firstChild);)e = e.previousSibling;
        return e && 3 != e.nodeType && (e = null), e && (t = e.nodeValue), t
    }, Number.prototype.toCeil = function (e) {
        for (var t = "1", n = 0; e > n; n++)t = 10 * t;
        return Math.ceil((this || 0) * t) / t
    }, Number.prototype.toFloor = function (e) {
        for (var t = "1", n = 0; e > n; n++)t = 10 * t;
        return Math.floor((this || 0) * t) / t
    }, Number.prototype.round = function (e) {
        e = e || 0;
        var t = this || 0;
        return Math.round(t * Math.pow(10, e)) / Math.pow(10, e)
    }, n(document).ready(function () {
        function l() {
            this.onerror = null, this.onclose = null, it = !1, setTimeout(function () {
                c()
            }, 2e3)
        }

        function u() {
            it = !0
        }

        function c() {
            nt && nt.close(), nt = new WebSocket(ws_path), nt.onerror = l, nt.onclose = l, nt.onopen = u, nt.onmessage = A
        }

        function d(e) {
            if (ht && rt) {
                var t = rt.length - 1;
                switch (ht.setState({range: {start: new Date(rt[t][0] - 864e5 * e), end: new Date(rt[t][0])}}), ht.draw(), google.visualization.events.trigger(ht, "statechange", {inProgress: !1}), n(".google_charts_zoom li").removeClass("active"), e) {
                    case 1:
                        n(".zoom_day").addClass("active");
                        break;
                    case 7:
                        n(".zoom_week").addClass("active");
                        break;
                    case 30:
                        n(".zoom_month").addClass("active")
                }
            }
        }

        function h() {
            if (window.location.hash) {
                var e = window.location.hash.substr(1).split("-");
                for (var t in pairs)if (pairs[t].symbol1 == e[0] && pairs[t].symbol2 == e[1]) {
                    I(pairs[t]), n("#pairs a,div").removeClass("active"), n("#pairs a:eq(" + t + ")").addClass("active"), n("#pairs div:eq(" + t + ")").addClass("active");
                    break
                }
                t == pairs.length && I(pairs[0])
            } else I(pairs[0])
        }

        function f(e) {
            n.jGrowl('<i class="icn icn-withdraw"></i> ' + w(e.amount) + " " + e.symbol + " has been credited to your account", {sticky: !0})
        }

        function p(e) {
            switch (e.type) {
                case"mining":
                    "BTC" != e.symbol || e.msymbol || n.jGrowl('<i class="icn icn-mine"></i> Block <a href="http://blockchain.info/block-height/' + e.block_height + '" target=_blank>#' + e.block_height + '</a> (<i class="icn-BTC"></i>' + w(e.block_value) + ') <br>Your reward: <i class="icn-BTC">' + w(e.amount), {sticky: !0});
                    break;
                case"withdraw":
                    n.jGrowl('<i class="icn icn-withdraw"></i> ' + w(e.amount) + " " + e.symbol + ' Withdrawal <a href="http://blockchain.info/tx/' + e.txid + '" target=_blank><small>' + e.txid.substr(0, 48) + "...</small></a>", {sticky: !0});
                    break;
                case"sell":
                    e.order || n.jGrowl('<i class="icn icn-buy-sell"></i> Sold ' + w((e.amount + e.fee_amount) / e.price) + " " + e.symbol2 + " at " + e.price + (e.fee_amount ? " Fee: " + w(e.fee_amount) : "") + " " + e.symbol, {sticky: !0});
                    break;
                case"buy":
                    e.order || n.jGrowl('<i class="icn icn-buy-sell"></i> Bought ' + w(e.amount) + " " + e.symbol + " at " + e.price + (e.fee_amount ? " Fee: " + w(e.fee_amount) : "") + " " + e.symbol2, {sticky: !0})
            }
        }

        function m(e) {
            var t = ["Buy", "Sell"], i = D(e), r = [T(i[0].data).data, k(i[1].data).data], o = r[0], a = r[1], s = o.concat(a), l = new google.visualization.DataTable;
            l.addColumn("number", "Volume");
            for (var u = 0; u < t.length; ++u)l.addColumn("number", t[u]);
            l.addRows(s.length);
            for (var u = 0; u < o.length; ++u)l.setCell(u, 0, s[u][0]), l.setCell(u, 1, o[u][1]);
            for (var u = o.length; u < s.length; ++u)l.setCell(u, 0, s[u][0]), l.setCell(u, 2, s[u][1]);
            gt.setDataTable(l), n("#loading-right").hide(), n("#market-depth-google").show(), n("#market-depth-google").addClass("redrawed"), gt.draw()
        }

        function g(e) {
            var i = ["Buy", "Sell"], r = D(e), o = [_(r[0].data), F(r[1].data)], a = o[0], s = o[1], a = t.groupBy(a, function (e) {
                return Number(parseFloat(e[0]).toFixed(3))
            }), l = [];
            t.each(a, function (e, t) {
                for (var n = 0, i = 0; i < e.length; i++)n += parseFloat(e[i][1]);
                l.push([Number(parseFloat(t)), Number(n.toFixed(5))])
            }), a = l, a.length > ot && (a = t.rest(a, a.length - ot));
            var s = t.groupBy(s, function (e) {
                return Number(parseFloat(e[0]).toFixed(3))
            }), l = [];
            t.each(s, function (e, t) {
                for (var n = 0, i = 0; i < e.length; i++)n += parseFloat(e[i][1]);
                l.push([Number(parseFloat(t)), Number(n.toFixed(5))])
            }), s = l, s.length > ot && (s = t.initial(s, s.length - ot));
            var u = a.concat(s), c = new google.visualization.DataTable;
            c.addColumn("string", "Volume");
            for (var d = 0; d < i.length; ++d)c.addColumn("number", i[d]);
            c.addRows(u.length);
            for (var d = 0; d < a.length; ++d)c.setCell(d, 0, u[d][0] + ""), c.setCell(d, 1, a[d][1]), c.setCell(d, 2, 0 / 0);
            for (var d = a.length; d < u.length; ++d)c.setCell(d, 0, u[d][0] + ""), c.setCell(d, 2, u[d][1]), c.setCell(d, 1, 0 / 0);
            mt.setDataTable(c), n("#loading-left").hide(), n("#market-bars-google").show(), n("#market-bars-google").addClass("redrawed"), mt.draw()
        }

        function v(e) {
            n("#market-bars-google").is(".visible") ? g(e) : m(e)
        }

        function y(e) {
            return balance[e] ? w(balance[e]) : 0
        }

        function b() {
            n("#order-buy-success").fadeOut(1e3), n("#order-buy-error").fadeOut(1e3), n("#order-sell-success").fadeOut(1e3), n("#order-sell-error").fadeOut(1e3), n("#order-ibuy-success").fadeOut(1e3), n("#order-ibuy-error").fadeOut(1e3), n("#order-isell-success").fadeOut(1e3), n("#order-isell-error").fadeOut(1e3), n("#order-success").fadeOut(1e3), n("#order-error").fadeOut(1e3)
        }

        function w(e) {
            var t = 1e8;
            return(e / t).toFixed(8)
        }

        function x(e) {
            return parseFloat(e || 0).toFixed(8)
        }

        function C(e, t) {
            switch (e) {
                default:
                    return'<i class="icn icn-' + e + '"></i>' + t
            }
        }

        function k(e) {
            var n = 0, i = {data: t.map(e, function (e) {
                return n += e[1], [e[0], w(n)]
            })};
            return i
        }

        function T(e) {
            var n = 0, i = {data: t.chain(e).map(function (e) {
                var t = e[0];
                try {
                    t = t.toFixed(10)
                } catch (i) {
                }
                return n += e[1], [e[0], w(n)]
            }).reverse().value()};
            return i
        }

        function _(e) {
            return t.sortBy(t.map(e, function (e) {
                return[e[0], e[1] / 1e8]
            }), function (e) {
                return e[0]
            })
        }

        function F(e) {
            return t.sortBy(t.map(e, function (e) {
                return[e[0], e[1] / 1e8]
            }), function (e) {
                return e[0]
            })
        }

        function D(e) {
            var n = e.buy.getValues().reverse(), i = e.sell.getValues(), r = n.length ? n[0][0] : 0, o = i.length ? i[0][0] : 0, a = r / 2, s = r - a, l = o + s;
            return[
                {data: t.filter(n, function (e) {
                    return e[0] > a
                })},
                {data: t.filter(i, function (e) {
                    return e[0] < l
                })}
            ]
        }

        function S(e) {
            e.classList.remove("highlight-red"), e.classList.add("highlight-green"), e.timer && clearTimeout(e.timer), e.timer = setTimeout(function () {
                e.classList.remove("highlight-green"), e.classList.remove("highlight-red")
            }, 1e3)
        }

        function E(e) {
            e.classList.remove("highlight-green"), e.classList.add("highlight-red"), e.timer && clearTimeout(e.timer), e.timer = setTimeout(function () {
                e.classList.remove("highlight-red"), e.classList.remove("highlight-green")
            }, 1e3)
        }

        function N(e) {
            e.classList.remove("highlight-green-ticker"), e.classList.remove("highlight-red-ticker"), e.classList.add("highlight-green-ticker"), setTimeout(function () {
                e.classList.remove("highlight-green-ticker")
            }, 750)
        }

        function M(e) {
            e.classList.remove("highlight-green-ticker"), e.classList.remove("highlight-red-ticker"), e.classList.add("highlight-red-ticker"), setTimeout(function () {
                e.classList.remove("highlight-red-ticker")
            }, 750)
        }

        function j(e, i) {
            if (i && "function" == typeof i && (ut.callback = i), !ut.strategy && !e)return nt.send(JSON.stringify({e: "calcfee", pair: s.symbol1 + ":" + s.symbol2})), void 0;
            e && t.extend(ut, e);
            var r = y(s.symbol1), o = y(s.symbol2);
            switch (ut.type) {
                case"buy":
                    var l = n("#buy-price").val(), u = n("#buy-amount").val(), c = ut.buyFee * l * u / 100;
                    (!c || isNaN(c)) && (c = 0), ut.buyFeeAmount = c;
                    var d = a(o, l, ut.buyFee);
                    n("#buy-amount").rules("add", {max: d, messages: {max: "<= " + d}}), n("#buy .fee")[0].firstChild.nodeValue = "(Fee: " + (c.toFixed(8) || "0.00000000") + " ";
                    break;
                case"sell":
                    var l = n("#sell-price").val(), u = n("#sell-amount").val(), c = ut.sellFee * l * u / 100;
                    n("#sell-amount").rules("add", {max: parseFloat(r).toFixed(8), messages: {max: "<= " + r}}), c && 0 / 0 != c || (c = 0), ut.sellFeeAmount = c, n("#sell .fee")[0].firstChild.nodeValue = "(Fee: " + (c.toFixed(8) || "0.000000000") + " "
            }
            ut.callback && "function" == typeof ut.callback && (ut.callback(ut), ut.callback = null)
        }

        function A(e) {
            var t;
            try {
                t = JSON.parse(e.data)
            } catch (i) {
                return
            }
            switch (t.e) {
                case"orders":
                    L(t.data);
                    break;
                case"fee":
                    j(t.data);
                    break;
                case"md":
                    $(t.data);
                    break;
                case"md_groupped":
                    O(t.data);
                    break;
                case"history":
                    q(t.data);
                    break;
                case"history-update":
                    z(t.data);
                    break;
                case"order":
                    R(t.data);
                    break;
                case"ohlcv24":
                    P(t.data);
                    break;
                case"ohlcv":
                    Y(t.data);
                    break;
                case"ohlcv-init":
                    B(t.data);
                    break;
                case"balance":
                    G(t.data);
                    break;
                case"tick":
                    W(t.data);
                    break;
                case"connected":
                    h(), nt.send(JSON.stringify({e: "init-chat"}));
                    break;
                case"tx":
                    p(t.data);
                    break;
                case"deposit":
                    f(t.data);
                    break;
                case"init":
                    V(t);
                    break;
                case"online":
                    t.online && n("span.usersonline").text(t.online);
                    break;
                case"message":
                    et(t), n(".msgWindow.scroll").each(function (e, t) {
                        n(t).scrollTop(n(t)[0].scrollHeight)
                    })
            }
        }

        function L(t) {
            r("orders-tbody").innerHTML = "", r("orders-loading").style.display = "none";
            for (var n = "", i = {buy: {}, sell: {}}, o = 0; o < t.length; o++) {
                var a = t[o].amount || 0, l = t[o].price;
                bt[t[o].id] = t[o], i[t[o].type][t[o].price] = 1, n += '<tr id="order-' + t[o].id + '"><td>' + e(parseInt(t[o].time)).utc().format("YYYY-MM-DD HH:mm:ss") + '</td><td><i class="icn-cart-' + ("buy" == t[o].type ? "in" : "out") + '"></i> ' + t[o].type.toUpperCase() + "</td><td>" + C(s.symbol1, w(a)) + '</td><td class="remains">' + C(s.symbol1, w(t[o].remains)) + "</td><td>" + t[o].price + "</td><td>" + C(s.symbol2, w(a * l)) + '</td><td class="fee"> ' + (("buy" == t[o].type ? t[o].tradingFeeBuy : t[o].tradingFeeSell) || "0.0") + ' </td><td class="action"><button class="btn btn-red btn-mini"><i class="icn-remove icon-white"></i> Cancel</button></td></tr>'
            }
            r("orders-tbody").innerHTML = n;
            var u = r("md-buy-tbody");
            for (o = 0; o < u.rows.length; ++o)i.buy[u.rows[o].getAttribute("price")] && (u.rows[o].className = "active");
            for (u = r("md-sell-tbody"), o = 0; o < u.rows.length; ++o)i.sell[u.rows[o].getAttribute("price")] && (u.rows[o].className = "active")
        }

        function H(e, n, i) {
            var o = r("md-" + e + "-tbody");
            if (n) {
                var a = document.createDocumentFragment(), l = {}, u = {};
                t.each(bt, function (t) {
                    t.type == e && (u[t.price] = 1)
                });
                for (var c = 0; c < n.length; ++c) {
                    {
                        var d = n[c][0], h = n[c][1];
                        d.toString().replace(".", "-")
                    }
                    l[d] = h;
                    var f = document.createElement("tr");
                    if (u[d] && (f.className = "active"), f.style.cursor = "pointer", f.onclick = autoFill, f.setAttribute("price", d), f.setAttribute("t", e), f.innerHTML = "<td>" + x(d) + '</td><td class="amount">' + C(s.symbol1, w(h)) + '</td><td class="amount-sum">' + C(s.symbol2, w(h * d)) + "</td></tr>", a.appendChild(f), pt[e] && pt[e][d]) {
                        var p = pt[e][d];
                        p > h ? E(f) : h > p && S(f)
                    } else pt[e] && S(f)
                }
                o.innerHTML = "", o.appendChild(a), r("md-" + e + "-total").innerHTML = (i / 1e8).toFixed(8), pt[e] = l
            }
        }

        function $(e) {
            pt || (pt = {}), r("md-buy-loading").style.display = "none", r("md-sell-loading").style.display = "none", r("md-buy-tbody").innerHTML = "", r("md-sell-tbody").innerHTML = "", r("md-sell-tbody").innerHTML = "", r("md-buy-tbody").innerHTML = "", H("sell", e.sell, e.sell_total), H("buy", e.buy, e.buy_total)
        }

        function O(e) {
            market_depth_groupped = {buy: new i(o), sell: new i(o)}, t.each(e.buy, function (e, t) {
                market_depth_groupped.buy.add([parseFloat(t), e])
            }), t.each(e.sell, function (e, t) {
                market_depth_groupped.sell.add([parseFloat(t), e])
            }), v(market_depth_groupped)
        }

        function q(t) {
            r("history-loading").style.display = "none", r("history-tbody").innerHTML = "";
            for (var n = "", i = 0; i < t.length; i++) {
                var o = t[i].split(":"), a = o[2], l = o[3];
                n += "<tr data><td>" + e(parseInt(o[1])).utc().format("YYYY-MM-DD HH:mm:ss") + "</td><td>" + o[0].toUpperCase() + "</td><td>" + C(s.symbol1, w(a)) + "</td><td>" + l + "</td><td>" + C(s.symbol2, w(a * l)) + "</td></tr>"
            }
            r("history-tbody").innerHTML = n
        }

        function z(t) {
            for (var n = r("history"), i = r("history-tbody"), o = n.rows.length, a = 0; a < t.length; a++) {
                var l = t[a], u = l[2], c = l[3], d = document.createElement("tr");
                for (d.innerHTML = "<td>" + e(parseInt(l[1])).utc().format("YYYY-MM-DD HH:mm:ss") + "</td><td>" + l[0].toUpperCase() + "</td><td>" + C(s.symbol1, w(u)) + "</td><td>" + c + "</td><td>" + C(s.symbol2, w(u * c)) + "</td>", i.insertBefore(d, i.firstChild), ++o; o > 50;)i.removeChild(i.lastChild), --o
            }
        }

        function R(t) {
            if (t.pair.symbol1 == s.symbol1 && t.pair.symbol2 == s.symbol2) {
                var i = r("order-" + t.id), o = parseInt(t.remains);
                if (i)o > 0 ? (i.cells[2].innerHTML = C(s.symbol1, w(o)), E(i)) : (t.cancel || n.jGrowl('<i class="icn-ok"></i> Your order #' + t.id + " has been completed", {sticky: !0}), delete bt[t.id], i.parentElement.removeChild(i)); else {
                    var a = parseInt(t.amount), l = t.price, u = document.createElement("tr");
                    u.id = "order-" + t.id, u.innerHTML = "<td>" + e(parseInt(t.time)).utc().format("YYYY-MM-DD<br>HH:mm:ss") + '</td><td><i class="icn-cart-' + ("buy" == t.type ? "in" : "out") + '"></i> ' + t.type.toUpperCase() + "</td><td>" + C(s.symbol1, w(a)) + '</td><td class="remains">' + C(s.symbol1, w(o)) + "</td><td>" + t.price + "</td><td>" + C(s.symbol2, w(o * l)) + '</td><td class="fee"> ' + (t.fee ? t.fee : "0") + ' </td><td class="action"><button class="btn btn-red btn-mini"><i class="icn-remove icon-white"></i> Cancel</button></td>', bt[t.id] = t, S(r("orders-tbody").appendChild(u));
                    var c = r("md-" + t.type + "-" + t.price.toString().replace(".", "-"));
                    c && c.classList.add("active")
                }
            }
        }

        function P(e) {
            r("ohlcv-open").innerHTML = C(s.symbol2, parseFloat(e[0]).toFixed(8)), r("ohlcv-high").innerHTML = C(s.symbol2, parseFloat(e[1]).toFixed(8)), r("ohlcv-low").innerHTML = C(s.symbol2, parseFloat(e[2]).toFixed(8)), r("ohlcv-close").innerHTML = C(s.symbol2, parseFloat(e[3]).toFixed(8)), r("ohlcv-volume").innerHTML = C(s.symbol1, w(e[4])), r("ohlcv-change").innerHTML = C(s.symbol2, (e[3] - e[0]).toFixed(8))
        }

        function Y(e) {
            if (e.o && e.v) {
                var t = e;
                if (rt) {
                    var n = ht.getDataTable(), i = rt.length - 1;
                    if (i >= 0 && rt[i][0] == 1e3 * t.time && (rt.splice(i, 1), n.removeRow(n.getNumberOfRows() - 1)), rt.push([1e3 * t.time, parseFloat(t.v), parseFloat(t.l), parseFloat(t.o), parseFloat(t.c), parseFloat(t.h)]), n.addRow([new Date(1e3 * t.time), t.v / 1e8]), ht.setDataTable(n), (new Date).getTime() - Ct > 6e4) {
                        Ct = (new Date).getTime();
                        var r = ht.getState(), o = new Date(1e3 * t.time);
                        1e3 * t.time - r.range.end.getTime() > 432e5 && (o = r.range.end), ht.setState({range: {start: r.range.start, end: o}}), ht.draw(), google.visualization.events.trigger(ht, "statechange", {inProgress: !1})
                    }
                }
            }
        }

        function B(e) {
            dt = e.length / 96;
            var n = new google.visualization.DataTable;
            n.addColumn("date", "Date"), n.addColumn("number", "Volume");
            var i = (new Date).getTime();
            e = t.map(e, function (e) {
                return[1e3 * e[0], parseFloat(e[1]), parseFloat(e[2]), parseFloat(e[3]), parseFloat(e[4]), parseFloat(e[5])]
            }), rt = e, t.each(e, function (e) {
                e.v = e[1], e.time = e[0], e && e.v && e.time >= i - 26784e5 && n.addRow([new Date(e.time), e[1] / 1e8])
            });
            var r = n.getNumberOfRows() - 1;
            n.getNumberOfRows() > 0 && ht.setState({range: {start: new Date(n.getValue(r, 0) - 864e5), end: new Date(n.getValue(r, 0))}}), ht.setDataTable(n), ht.draw(), google.visualization.events.trigger(ht, "statechange", {InProgress: !1}), d(dt)
        }

        function G(e) {
            balance[e.symbol] = e.balance;
            var t = w(e.balance), i = C(e.symbol, t);
            n(".balance-" + e.symbol).html(i), n(".balanceraw-" + e.symbol).text(t), e.symbol == s.symbol2 && (n(".symbol2-available").html(i), n("#ibuy [name=amount]").rules("add", {max: y(s.symbol2), messages: {max: "<= " + y(s.symbol2)}})), e.symbol == s.symbol1 && (n(".symbol1-available").html(i), n("#sell [name=amount]").rules("add", {max: y(s.symbol1), min: s.lot_size, messages: {max: "<= " + y(s.symbol1), min: ">= " + s.lot_size}}), n("#isell [name=amount]").rules("add", {max: y(s.symbol1), messages: {max: "<= " + y(s.symbol1)}}))
        }

        function W(e) {
            for (var t = r("ticker-" + e.symbol1 + "-" + e.symbol2), n = 0; n < pairs.length; ++n)pairs[n].symbol1 == e.symbol1 && pairs[n].symbol2 == e.symbol2 && (pairs[n].lastprice = e.price);
            var i = r("ticker-" + e.symbol1 + "-" + e.symbol2 + "-price");
            if (i) {
                var o = parseFloat(i._innerText());
                if (o != parseFloat(e.price)) {
                    var a = x(e.price);
                    i.innerHTML = a, e.price > o ? N(t) : M(t), e.symbol1 == s.symbol1 && e.symbol2 == s.symbol2 && (r("buy-price").placeholder = a, r("sell-price").placeholder = a, r("ohlcv-close").innerHTML = C(s.symbol2, parseFloat(e.price).toFixed(8)), document.title = "[" + (e.price > o ? "↑" : "↓") + x(e.price) + "] CEX.IO")
                }
            }
        }

        function U(e, t) {
            var n = r(e);
            n.innerHTML = t, n.style.display = "block"
        }

        function I(t) {
            ut = {}, pt = null, market_depth_groupped = null, dt = 1, rt = null, n(".google_charts_zoom li").removeClass("active"), n(".google_charts_zoom").hide(), n(".zoom_day").addClass("active"), U("loading-candelistic-chart", st), U("loading-left", st), U("loading-right", st), U("md-buy-loading", st), U("md-sell-loading", st), U("history-loading", st), n("#market-bars-google,#market-depth-google,#google_candelistic_chart").hide(), n("#market-bars-google,#market-depth-google").removeClass("redrawed"), r("google_control").style.opacity = "0", lt.forEach(function (e) {
                e.resetForm()
            }), n("form").validate().resetForm(), n(".error").removeClass("error,success"), n("form").find("input[type=text], textarea").val(""), r("orders-tbody").innerHTML = "", r("md-buy-tbody").innerHTML = "", r("md-sell-tbody").innerHTML = "", r("history-tbody").innerHTML = "";
            var i = symbols[t.symbol1];
            i.contract ? (r("contract-description").innerHTML = i.description.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g, '"'), r("contract-expires").innerHTML = i.expires ? e(1e3 * i.expires).utc().format("YYYY-MM-DD HH:mm") : "-", r("contract-shipping").innerHTML = i.shipping ? e(1e3 * i.shipping).utc().format("YYYY-MM-DD HH:mm") : "-", r("contract-symbol").innerHTML = t.symbol1, r("contract").style.display = "block") : r("contract").style.display = "none", n(".symbol i").removeClass().addClass("icn icn-" + t.symbol1 + "-r"), n(".symbol1").text(t.symbol1), n(".symbol2").text(t.symbol2), n(".symbol1-available").text(y(t.symbol1)), n(".symbol2-available").text(y(t.symbol2)), r("buy-price").placeholder = t.lastprice, r("sell-price").placeholder = t.lastprice, n("#ibuy [name=amount]").rules("add", {max: y(t.symbol2), messages: {max: "<= " + y(t.symbol2)}}), n("#isell [name=amount]").rules("add", {max: y(t.symbol1), messages: {max: "<= " + y(t.symbol1)}}), s ? (nt.send(JSON.stringify({e: "unsubscribe", rooms: ["tickers", "pair-" + s.symbol1 + "-" + s.symbol2]})), s = t, nt.send(JSON.stringify({e: "subscribe", rooms: ["tickers", "pair-" + s.symbol1 + "-" + s.symbol2]}))) : (s = t, nt.send(JSON.stringify({e: "subscribe", rooms: ["tickers", "pair-" + s.symbol1 + "-" + s.symbol2]})))
        }

        function V(e) {
            n(".chat").remove(), n("body").append(e.html), X(!1), n("#msg").on("keypress", function (e) {
                return Q(1), Z(n(".chat .main-window")), 10 != e.keyCode && 13 != e.keyCode || !e.ctrlKey && !e.shiftKey ? (13 == e.keyCode && (tt(), e.stopPropagation(), e.stopped = !0, e.preventDefault()), void 0) : (n(this).val(n(this).val() + "\n"), e.stopPropagation(), e.stopped = !0, e.preventDefault(), void 0)
            }), n(".chat-tabs li a").on("click", function (e) {
                e.preventDefault(), n(this).tab("show");
                n(this).children("a").attr("href");
                t.each(document.querySelectorAll(".chat-tabs li"), function (e) {
                    e.className = e.className.replace("active", "")
                }), n(".msgWindow.scroll").each(function (e, t) {
                    n(t).scrollTop(n(t)[0].scrollHeight)
                }), n(this).parent().addClass("active")
            }), n(".chat-bottom").click(function () {
                try {
                    ga("send", "event", "Chat", "click", "Open")
                } catch (e) {
                }
                n(".chat .main-window").removeClass("hidden"), n(".chat .main-window").animate({opacity: 1}, 300, function () {
                    n(".chat-bottom").slideUp(), n(".msgWindow.scroll").each(function (e, t) {
                        n(t).scrollTop(n(t)[0].scrollHeight)
                    }), n(".chat .main-window").is(".resizable") || (pure_draggable(n(".chat .main-window")[0], {onDragEnd: function () {
                        Z(n(".chat .main-window"))
                    }, dragClass: "head-text"}), pure_resizable(n(".chat .main-window")[0], {onStop: function () {
                        Z(n(".chat .main-window")), Q(1), n(".chat textarea").trigger("resize")
                    }}), n(window).resize(function () {
                        Q()
                    }), n(".chat textarea").autoResize({limit: 300, extraSpace: 0, onResize: function (e) {
                        n(".main-window").css({"padding-bottom": e + 122 + "px"}), Q(1)
                    }})), setTimeout(function () {
                        K(n(".chat .main-window")), Z(n(".chat .main-window")), Q()
                    }, 300)
                })
            }), n(".close").click(function () {
                n(".chat .main-window").animate({opacity: 0}, 500, function () {
                    n(".chat .main-window").addClass("hidden"), Z(n(".chat .main-window"), !0)
                }), n(".chat-bottom").slideDown()
            }), n(".sender-btn").click(function () {
                tt()
            }), n("input.ban-user").on("keypress", function (e) {
                if (13 == e.keyCode) {
                    var t = n(this).val(), i = n(".reason").val();
                    if ("" == i)return alert("Plaese enter reason for ban"), n(".reason").focus(), void 0;
                    nt.send(JSON.stringify({e: "banuser", user: t, reason: i, target: n(".msgWindow:visible").attr("id"), ttl: n(".ttl").val()})), n(this).val(""), e.stopPropagation(), e.stopped = !0, e.preventDefault()
                }
            }), n("input.reason").on("keypress", function (e) {
                if (13 == e.keyCode) {
                    var e = "banuser", t = n("input.ban-user").val(), i = n("input.warn-user").val();
                    if ("" == t && "" == i)return alert("Plaese enter user for ban"), n(".ban-user").focus(), void 0;
                    "" == t && (e = "warn", t = i);
                    var r = n(".reason").val();
                    if ("" == r)return alert("Plaese enter reason for ban"), n(".reason").focus(), void 0;
                    nt.send(JSON.stringify({e: e, user: t, reason: r, target: n(".msgWindow:visible").attr("id"), ttl: n(".ttl").val()})), n(this).val(""), e.stopPropagation(), e.stopped = !0, e.preventDefault()
                }
            }), n("input.warn-user").on("keypress", function (e) {
                if (13 == e.keyCode) {
                    var t = n(".reason").val();
                    if ("" == t)return alert("Plaese enter reason for warn"), n(".reason").focus(), void 0;
                    nt.send(JSON.stringify({e: "warn", reason: t, target: n(".msgWindow:visible").attr("id"), ttl: n(".ttl").val(), user: n(this).val()})), n(this).val(""), e.stopPropagation(), e.stopped = !0, e.preventDefault()
                }
            }), n(".msgWindow").on("scroll", function () {
                n(this)[0].scrollHeight - n(this).scrollTop() > n(this).height() + 60 ? n(this).removeClass("scroll") : n(this).addClass("scroll")
            }), K(n(".chat .main-window"))
        }

        function X(e) {
            n("input#userName").prop("disabled", !e)
        }

        function J() {
            try {
                return"localStorage"in window && null !== window.localStorage
            } catch (e) {
                return!1
            }
        }

        function Q(e) {
            var t = Date.now(), n = window.document.querySelector(".chat .main-window");
            if (!(1e3 > t - kt)) {
                kt = t;
                var i = window.innerHeight, r = window.innerWidth, o = n.offsetLeft, a = n.offsetTop, s = parseFloat(document.defaultView.getComputedStyle(n).width, 10), l = parseFloat(document.defaultView.getComputedStyle(n).height, 10);
                if (e)o + s > r && (n.style.width = r - o + "px"), l + a > i && (n.style.height = i - l - 50 + "px"); else {
                    if (s > r + 30 && (n.style.width = r - 30 + "px"), l + 200 > i && (n.style.height = i - 200 + "px"), o + s + 20 >= r) {
                        var u = 0 > r - s - 20 ? 0 : r - s - 20;
                        n.style.left = u + "px"
                    }
                    if (a + l + 200 >= i) {
                        var c = 0 > i - l - 210 ? 0 : i - l - 210;
                        n.style.top = c + "px"
                    }
                    if (40 > a) {
                        var c = 40;
                        n.style.top = c + "px"
                    }
                }
            }
        }

        function Z(e, t) {
            if (e && e.position() && J() && "auto" != e.position().left)try {
                if (t)e.removeAttr("style"), e.removeClass("resizeble"), localStorage.removeItem("chat-p"); else {
                    var n = {position: t ? !1 : {top: e.css("top").replace("px", ""), left: e.css("left").replace("px", "")}, width: e.width(), closed: e.is(".hidden"), height: e.height(), lastMessage: e.find("#msg").val()};
                    localStorage.setItem("chat-p", JSON.stringify(n))
                }
            } catch (i) {
            }
        }

        function K(e) {
            if (e && J())try {
                var t = JSON.parse(localStorage.getItem("chat-p"));
                if (t) {
                    if (!t.closed && n(".chat .main-window").is(".hidden"))return n(".chat-bottom").click(), void 0;
                    t && t.position && e.css({left: (t.position.left < 0 ? 0 : t.position.left) + "px", top: (t.position.top < 0 ? 0 : t.position.top) + "px"}), e.width(t.width), e.height(t.height), e.find("#msg").val(t.lastMessage).trigger("resize"), setTimeout(function () {
                        Q()
                    }, 1e3)
                } else {
                    var i = n(window).height(), r = n(window).width() - 234, o = i - 500;
                    0 > o && (o = 40), n(".chat .main-window").css({top: o, left: r})
                }
                n(".msgWindow.scroll").each(function (e, t) {
                    n(t).scrollTop(n(t)[0].scrollHeight)
                })
            } catch (a) {
            }
        }

        function et(e) {
            var t, i = new Date(e.time), r = "";
            e.isadmin && "false" != e.isadmin && (r = " color:red; "), t = "<span class='allMsg'><span class='user' style='" + r + "'>" + e.source + " : </span><span class='time'> " + i.getHours() + ":" + (1 == i.getMinutes().toString().length ? "0" + i.getMinutes() : i.getMinutes()) + "</span><br>" + e.message.replace(new RegExp("\n", "g"), "<br>") + "</span>", n("#" + e.target).append(t), n(".chat .main-window").is(".hidden") && n(".new-message").animate({opacity: 1}, 500, function () {
                n(".new-message").animate({opacity: 0}, 500)
            })
        }

        function tt() {
            var e = n("select#users").val();
            nt.send(JSON.stringify({e: "message", inferSrcUser: !0, source: e, message: n("#msg").val(), target: n(".msgWindow:visible").attr("id")})), n("#msg").val("")
        }

        var nt, it = !1;
        c();
        var rt, ot = 20, at = 40, st = '<div id="floatingCirclesG" class="loading_animation">		<div class="f_circleG" id="frotateG_01"></div><div class="f_circleG" id="frotateG_02">	</div><div class="f_circleG" id="frotateG_03">	</div><div class="f_circleG" id="frotateG_04">	</div><div class="f_circleG" id="frotateG_05">	</div><div class="f_circleG" id="frotateG_06">	</div><div class="f_circleG" id="frotateG_07">	</div><div class="f_circleG" id="frotateG_08">	</div></div>', lt = [], ut = {}, ct = null;
        n(window).on("resize", function (e) {
            e.target == window && ft && (ct || (ct = setTimeout(function () {
                try {
                    ht.draw(), ft.draw(), gt.draw(), mt.draw()
                } catch (e) {
                }
                ct = null
            }, 2e3)))
        }), n(".market .bars").click(function () {
            n(this).is(".active") || (n(".market ul li").removeClass("active"), n(this).addClass("active"), n.when(n("#gcwarper").animate({"margin-left": 0})).done(function () {
                setTimeout(function () {
                    if (mt && !n("#market-bars-google").is(".redrawed"))try {
                        g(market_depth_groupped)
                    } catch (e) {
                    }
                    n("#market-bars-google").addClass("visible"), n("#market-depth-google").removeClass("visible")
                }, 100)
            }))
        }), n(".market .depth").click(function () {
            n(this).is(".active") || (n(".market ul li").removeClass("active"), n(this).addClass("active"), n.when(n("#gcwarper").animate({"margin-left": "-100%"})).done(function () {
                setTimeout(function () {
                    if (gt && !n("#market-depth-google").is(".redrawed"))try {
                        m(market_depth_groupped)
                    } catch (e) {
                    }
                    n("#market-depth-google").addClass("visible"), n("#market-bars-google").removeClass("visible")
                }, 100)
            }))
        });
        var dt = 1;
        n(".zoom_month").click(function () {
            n(this).is(".active") || (30 > dt ? (n("#google_candelistic_chart").hide(), r("google_control").style.opacity = "0", U("loading-candelistic-chart", st), nt.send(JSON.stringify({e: "ohlcv-month", pair: s.symbol1 + ":" + s.symbol2}))) : d(30))
        }), n(".zoom_week").click(function () {
            n(this).is(".active") || (7 > dt ? (n("#google_candelistic_chart").hide(), r("google_control").style.opacity = "0", U("loading-candelistic-chart", st), nt.send(JSON.stringify({e: "ohlcv-week", pair: s.symbol1 + ":" + s.symbol2}))) : d(7))
        }), n(".zoom_day").click(function () {
            n(this).is(".active") || d(1)
        }), n(".symbol1-available").click(function () {
            var e = this._innerText();
            e && "" != e && (n("#trade").is(":visible") ? (n("#sell-price").val(n("#sell-price").attr("placeholder")), n("#sell-amount").val(e).trigger("change")) : n("#isell-amount").val(e).trigger("change"))
        }), n(".symbol2-available").click(function () {
            var e = this._innerText();
            e && "" != e && (n("#trade").is(":visible") ? (n("#buy-price").val(n("#buy-price").attr("placeholder")), j(null, function () {
                var t = a(e, n("#buy-price").attr("placeholder"), ut.buyFee);
                n("#buy-amount").val(t), ut.callback = null, n("#buy-amount").trigger("change")
            })) : n("#ibuy-amount").val(e).trigger("change"))
        });
        var ht = new google.visualization.ControlWrapper({controlType: "ChartRangeFilter", containerId: "google_control", options: {filterColumnIndex: 0, ui: {chartType: "ComboChart", backgroundColor: {fill: "transparent"}, chartOptions: {fontName: '"Open Sans", "Lucida Grande", Verdana, Arial, Helvetica, sans-serif', backgroundColor: {fill: "transparent"}, height: 70, chartArea: {left: 5, top: 0, width: "99%", backgroundColor: {fill: "transparent"}, height: 50}, seriesType: "bars", series: {0: {targetAxisIndex: 1, type: "bars", color: "#4b71a2", hAxis: {baselineColor: "none"}}}, hAxis: {baselineColor: "none", textPosition: "out", textStyle: {color: "#ddd"}, format: "yyyy.MM.dd"}}, minRangeSize: 216e5}}, state: {range: {start: new Date(Date.now() - 432e5), end: new Date(Date.now())}}}), ft = new google.visualization.ChartWrapper({chartType: "ComboChart", containerId: "google_candelistic_chart", options: {height: 300, fontName: '"Open Sans", "Lucida Grande", Verdana, Arial, Helvetica, sans-serif', backgroundColor: "transparent", chartArea: {height: "70%", width: "90%"}, hAxis: {slantedText: !1, minTextSpacing: "40", maxAlternation: 1}, vAxis: {format: "#,#####0.00000"}, legend: {position: "none"}, tooltip: {isHtml: !0}, seriesType: "bars", series: {0: {targetAxisIndex: 1, type: "bars", color: "#dfe1e0", hAxis: {baselineColor: "none", gridlines: {color: "#fff"}}, vAxis: {gridlines: {color: "#fff"}}}, 1: {type: "candlesticks", targetAxisIndex: 0, color: "black", candlestick: {fallingColor: {fill: "#c21435", stroke: "#c21435", color: "#c21435", strokeWidth: 1}, risingColor: {fill: "#106aa9", stroke: "#106aa9", color: "#106aa9", strokeWidth: 1}}}}}, view: {columns: [
            {calc: function (e, t) {
                var n = e.getValue(t, 0);
                return e.getValue(e.getNumberOfRows() - 1, 0).getTime() - e.getValue(0, 0).getTime() <= 216e5 ? "" + (1 == n.getUTCHours().toString().length ? "0" + n.getUTCHours() : n.getUTCHours()) + ":" + (1 == n.getUTCMinutes().toString().length ? "0" + n.getUTCMinutes() : n.getUTCMinutes()) : "" + n.getUTCFullYear() + "." + (n.getUTCMonth() + 1) + "." + (1 == n.getUTCDate().toString().length ? "0" + n.getUTCDate() : n.getUTCDate())
            }, type: "string"},
            1,
            2,
            3,
            4,
            5,
            6
        ]}});
        google.visualization.events.addListener(ht, "statechange", function (e) {
            if (e.inProgress)n(".google_charts_zoom li").removeClass("active"); else {
                var i = ht.getState().range, r = i.start, o = i.end;
                rt = rt || ft.getDataTable();
                var a = (ft.getDataTable(), new google.visualization.DataTable);
                a.addColumn("date", "Date"), a.addColumn("number", "Volume"), a.addColumn("number", "Stock low"), a.addColumn("number", "Stock open"), a.addColumn("number", "Stock close"), a.addColumn("number", "Stock high"), a.addColumn({type: "string", role: "tooltip", p: {html: !0}}), rows_to_Show = t.filter(rt, function (e) {
                    return e[0] >= r.getTime() && e[0] <= o.getTime()
                });
                for (var s, l, u, c, d, h = 0, f = rows_to_Show.length % at, p = 0; p < rows_to_Show.length; p++) {
                    var m = rows_to_Show[p], g = m[1] / 1e8, v = m[5], y = m[2], b = m[4], w = d || m[3], x = 1 * m[0];
                    if (d || (d = w), s && s > x ? s = x : s || (s = x), l && x > l ? l = x : l || (l = x), u && u > y ? u = y : u || (u = y), c && v > c ? c = v : c || (c = v), h += g, rows_to_Show.length > at) {
                        if (p % (rows_to_Show.length / at).toFixed() == 0 && 0 != p) {
                            var C = new Date((s + l) / 2);
                            s = new Date(s), l = new Date(l), a.addRow([C, h, u, w, b, c, '<div class="highcharts-tooltip" zIndex="8" style="cursor:default;padding:0;white-space:nowrap;" visibility="visible" transform="translate(570,40)" opacity="1"><span style="font-size: 10px" x="8">Date: ' + s.getUTCFullYear() + "." + (s.getUTCMonth() + 1) + "." + (1 == s.getUTCDate().toString().length ? "0" + s.getUTCDate() : s.getUTCDate()) + " " + s.getUTCHours() + ":" + (1 == s.getUTCMinutes().toString().length ? "0" + s.getUTCMinutes() : s.getUTCMinutes()) + " - " + l.getUTCFullYear() + "." + (l.getUTCMonth() + 1) + "." + (1 == l.getUTCDate().toString().length ? "0" + l.getUTCDate() : l.getUTCDate()) + " " + l.getUTCHours() + ":" + (1 == l.getUTCMinutes().length ? "0" + l.getUTCMinutes() : l.getUTCMinutes()) + '</span><br><span x="8" dy="16">Open:  ' + w + '</span><br><span x="8" dy="16">High:  ' + c + '</span><br><span x="8" dy="16">Low:  ' + u + '</span><br><span x="8" dy="16">Close: ' + b + '</span><br><span style="fill:#2f7ed8" x="8" dy="16">Volume</span><span dx="0">: </span><span style="font-weight:bold" dx="0">' + h + "</span></div>"]), s = null, l = null, u = null, c = null, d = null, h = 0
                        } else if (0 != f && p == rows_to_Show.length - 1) {
                            var C = new Date((s + l) / 2);
                            s = new Date(s), l = new Date(l), a.addRow([C, h, u, w, b, c, '<div class="highcharts-tooltip" zIndex="8" style="cursor:default;padding:0;white-space:nowrap;" visibility="visible" transform="translate(570,40)" opacity="1"><span style="font-size: 10px" x="8">Date: ' + s.getUTCFullYear() + "." + (s.getUTCMonth() + 1) + "." + (1 == s.getUTCDate().toString().length ? "0" + s.getUTCDate() : s.getUTCDate()) + " " + s.getUTCHours() + ":" + (1 == s.getUTCMinutes().toString().length ? "0" + s.getUTCMinutes() : s.getUTCMinutes()) + " - " + l.getUTCFullYear() + "." + (l.getUTCMonth() + 1) + "." + (1 == l.getUTCDate().toString().length ? "0" + l.getUTCDate() : l.getUTCDate()) + " " + l.getUTCHours() + ":" + (1 == l.getUTCMinutes().length ? "0" + l.getUTCMinutes() : l.getUTCMinutes()) + '</span><br><span x="8" dy="16">Open:  ' + w + '</span><br><span x="8" dy="16">High:  ' + c + '</span><br><span x="8" dy="16">Low:  ' + u + '</span><br><span x="8" dy="16">Close: ' + b + '</span><br><span style="fill:#2f7ed8" x="8" dy="16">Volume</span><span dx="0">: </span><span style="font-weight:bold" dx="0">' + h + "</span></div>"]), s = null, l = null, u = null, c = null, d = null, h = 0
                        }
                    } else {
                        var x = new Date(m[0]);
                        a.addRow([x, g, y, m[3], b, v, '<div class="highcharts-tooltip" zIndex="8" style="cursor:default;padding:0;white-space:nowrap;" visibility="visible" transform="translate(570,40)" opacity="1"><span style="font-size: 10px" x="8">Date: ' + x.getUTCFullYear() + "." + (x.getUTCMonth() + 1) + "." + (1 == x.getUTCDate().toString().length ? "0" + x.getUTCDate() : x.getUTCDate()) + " " + x.getUTCHours() + ":" + (1 == x.getUTCMinutes().toString().length ? "0" + x.getUTCMinutes() : x.getUTCMinutes()) + '</span><br><span x="8" dy="16">Open:  ' + m[3] + '</span><br><span x="8" dy="16">High:  ' + v + '</span><br><span x="8" dy="16">Low:  ' + y + '</span><br><span x="8" dy="16">Close: ' + b + '</span><br><span style="fill:#2f7ed8" x="8" dy="16">Volume</span><span dx="0">: </span><span style="font-weight:bold" dx="0">' + g + "</span></div>"])
                    }
                }
                ft.setDataTable(a), 0 == n("#google_control").css("opacity") && n("#google_control").animate({opacity: "1"}), n(".google_charts_zoom").show(), n("#loading-candelistic-chart").hide(), n("#google_candelistic_chart").show(), ft.draw()
            }
        });
        var pt, mt = new google.visualization.ChartWrapper({chartType: "ColumnChart", containerId: "market-bars-google", slantedText: !1, options: {fontName: '"Open Sans", "Lucida Grande", Verdana, Arial, Helvetica, sans-serif', height: 300, width: "100%", legend: {position: "none"}, chartArea: {left: 60, top: 10, height: "80%", width: "90%"}, vAxis: {minValue: 0, format: "###,###"}, hAxis: {baselineColor: "none", gridlines: {color: "#fff", count: -1}, minTextSpacing: "70", maxAlternation: 1, slantedText: !1}, bar: {groupWidth: "99%"}, colors: ["#92b6e8", "#aace6c"], seriesType: "bars", animation: {duration: 100, easing: "out"}}}), gt = new google.visualization.ChartWrapper({chartType: "AreaChart", containerId: "market-depth-google", slantedText: !1, options: {fontName: '"Open Sans", "Lucida Grande", Verdana, Arial, Helvetica, sans-serif', height: 300, width: "100%", legend: {position: "none"}, slantedText: !1, chartArea: {left: 60, top: 10, height: "80%", width: "90%"}, vAxis: {minValue: 0, format: "###,###"}, hAxis: {baselineColor: "none", gridlines: {color: "#fff", count: -1}, minTextSpacing: "50", maxAlternation: 1, slantedText: !1}, colors: ["#92b6e8", "#aace6c"], backgroundColor: "#fff", animation: {duration: 100, easing: "out"}}}), vt = (new Date).getTime();
        n("#pairs a").on("click", function (e) {
            var i = (new Date).getTime();
            if (i - vt > 500 && it) {
                vt = i;
                var r = n(e.delegateTarget).attr("id").split("-").slice(1);
                return n("#pairs div, #pairs a").removeClass("active"), e.stopPropagation(), t.each(pairs, function (e, t) {
                    return e.symbol1 == r[0] && e.symbol2 == r[1] ? (n("#pairs a:eq(" + t + ")").addClass("active"), n("#pairs div:eq(" + t + ")").addClass("active"), I(e), !1) : void 0
                }), !0
            }
            vt = i
        });
        var yt = null, bt = {}, wt = {rules: {amount: {required: !0, number: !0, min: 1e-8}, price: {required: !0, number: !0, min: 1e-8}}, messages: {amount: {required: "required", number: "", min: ">=0.00000001"}, price: {required: "required", number: "", min: ">= 0.00000001"}}, errorClass: "help-inline", errorElement: "span", errorPlacement: function (e, t) {
            e.appendTo(t.parent("div").parent("div"))
        }, highlight: function (e) {
            n(e).parents(".control-group").removeClass("success"), n(e).parents(".control-group").addClass("error")
        }, unhighlight: function (e) {
            n(e).parents(".control-group").removeClass("error"), n(e).parents(".control-group").addClass("success")
        }, submitHandler: function (e) {
            var t = "buy", i = ut.buyFeeAmount, r = ut.buyFee;
            "s" == e.id.charAt(0) && (t = "sell", i = ut.sellFeeAmount, r = ut.sellFee), n("#confirm-type").text(e.id.charAt(0).toUpperCase() + e.id.slice(1)), n("#confirm-amount").text(e.amount.value + " " + s.symbol1), n("#confirm-price").text(e.price.value + " " + s.symbol2), n("#confirm-sum").text((e.price.value * e.amount.value).toFixed(8)), n(".fee-amount").text((i.toFixed(8) || "0.0") + " "), n(".fee-percent").text((r || "0.0") + " %"), n("#confirm").modal(), n("#confirm-ok").unbind("click"), n("#confirm-ok").click(function () {
                n("#confirm").modal("hide");
                var t = {type: e.id, symbol1: s.symbol1, symbol2: s.symbol2, amount: e.amount.value, price: e.price.value, _csrf: csrf};
                n.post("/trade/api/order", n.param(t),function (t) {
                    if ("OK" == t.error) {
                        n("#order-" + e.id + "-error").hide(), n("#order-" + e.id + "-success").addClass("in"), n("#order-" + e.id + "-success span").html(t.message), n("#order-" + e.id + "-success").show();
                        try {
                            "s" == e.id.charAt(0) ? ga("send", "event", "PlaceOrder", "click", "SellGHS") : ga("send", "event", "PlaceOrder", "click", "BuyGHS")
                        } catch (i) {
                        }
                    } else n("#order-" + e.id + "-success").hide(), n("#order-" + e.id + "-error").addClass("in"), n("#order-" + e.id + "-error span").html(t.error), n("#order-" + e.id + "-error").show();
                    yt && clearTimeout(yt), yt = setTimeout(b, 5e3)
                }, "json").fail(function () {
                    var t = "network connection error";
                    n("#order-" + e.id + "-success").hide(), n("#order-" + e.id + "-error").addClass("in"), n("#order-" + e.id + "-error span").html(t), n("#order-" + e.id + "-error").show(), yt && clearTimeout(yt), yt = setTimeout(b, 5e3)
                })
            })
        }};
        lt.push(n("#buy").validate(wt)), lt.push(n("#sell").validate(wt));
        var xt = {rules: {amount: {required: !0, number: !0, min: 1e-8}}, messages: {amount: {required: "required", number: "", min: ">=0.00000001"}}, errorClass: "help-inline", errorElement: "span", errorPlacement: function (e, t) {
            e.appendTo(t.parent("div").parent("div"))
        }, highlight: function (e) {
            n(e).parents(".control-group").removeClass("success"), n(e).parents(".control-group").addClass("error")
        }, unhighlight: function (e) {
            n(e).parents(".control-group").removeClass("error"), n(e).parents(".control-group").addClass("success")
        }, submitHandler: function (e) {
            function t() {
                var t = ut.buyFee;
                "s" == e.id.charAt(1) && (type = "sell", fee_amount = ut.sellFeeAmount, t = ut.sellFee), n(".fee-percent").text((t || "0.0") + " %")
            }

            ut.buyFee ? t() : j(null, t), n("#iconfirm-type").text(e.id.charAt(1).toUpperCase() + e.id.slice(2)), "s" == e.id.charAt(1) ? n("#iconfirm-type").text("Sell " + e.amount.value + " " + s.symbol1) : n("#iconfirm-type").text("Buy " + s.symbol1 + " for " + e.amount.value + " " + s.symbol2), n("#iconfirm").modal(), n("#iconfirm-ok").unbind("click"), n("#iconfirm-ok").click(function () {
                n("#iconfirm").modal("hide");
                var t = {type: e.id.substr(1), symbol1: s.symbol1, symbol2: s.symbol2, amount: e.amount.value, _csrf: csrf};
                n.post("/trade/api/instant_order", n.param(t),function (t) {
                    if ("OK" == t.error) {
                        n("#order-" + e.id + "-error").hide(), n("#order-" + e.id + "-success").addClass("in"), n("#order-" + e.id + "-success span").html(t.message), n("#order-" + e.id + "-success").show();
                        try {
                            "s" == e.id.charAt(1) ? ga("send", "event", "PlaceOrder", "click", "SellGHS") : ga("send", "event", "PlaceOrder", "click", "BuyGHS")
                        } catch (i) {
                        }
                    } else n("#order-" + e.id + "-success").hide(), n("#order-" + e.id + "-error").addClass("in"), n("#order-" + e.id + "-error span").html(t.error), n("#order-" + e.id + "-error").show();
                    yt && clearTimeout(yt), yt = setTimeout(b, 5e3)
                }, "json").fail(function () {
                    var t = "network connection error";
                    n("#order-" + e.id + "-success").hide(), n("#order-" + e.id + "-error").addClass("in"), n("#order-" + e.id + "-error span").html(t), n("#order-" + e.id + "-error").show(), yt && clearTimeout(yt), yt = setTimeout(b, 5e3)
                })
            })
        }};
        lt.push(n("#ibuy").validate(xt)), lt.push(n("#isell").validate(xt)), window.autoFill = function (e) {
            var t = e.currentTarget, i = parseFloat(t.getAttribute("price")), o = t.getAttribute("t"), a = 0;
            for (var s in pt[o])"buy" == o && s >= i ? a += pt[o][s] : "sell" == o && i >= s && (a += pt[o][s]);
            o = "sell" == o ? "buy" : "sell", r(o + "-price").value = i, r(o + "-amount").value = (a / 1e8).toFixed(8), n("#" + o + "-amount").trigger("change"), n("html, body").animate({scrollTop: n(".buy-sell").offset().top}, 200), n("#" + o + "-amount").focus()
        };
        var Ct = (new Date).getTime();
        n("#buy-amount, #buy-price").on("keyup input change", function () {
            if (ut.type = "buy", j(), n("#buy").valid()) {
                var e = 0, t = parseFloat(r("buy-price").value) || 0, i = parseFloat(r("buy-amount").value) || 0;
                e += i * t, r("buy-sum").innerHTML = (e + (ut.buyFeeAmount || 0)).toFixed(8)
            }
        }), n("#ibuy-amount").on("keyup input change", function () {
            if (n("#ibuy").valid()) {
                var e = 0, t = parseFloat(r("ibuy-amount").value) || 0;
                market_depth_groupped.sell.inOrderTraverse(function (n) {
                    var i = n[1] / 1e8, r = n[0], o = i * r;
                    return t > 0 ? (o > t ? (e += t / r, t = 0) : (e += i, t -= o), void 0) : !0
                }), r("ibuy-sum").value = e.toFixed(8)
            }
        }), n("#isell-amount").on("keyup input change", function () {
            if (n("#isell").valid()) {
                var e = 0, t = parseFloat(r("isell-amount").value) || 0;
                market_depth_groupped.buy.reverseOrderTraverse(function (n) {
                    var i = n[1] / 1e8, r = n[0];
                    return t > 0 ? (i > t ? (e += t * r, t = 0) : (e += i * r, t -= i), void 0) : !0
                }), r("isell-sum").value = e.toFixed(8)
            }
        }), n("#sell-amount, #sell-price").on("keyup input change", function () {
            if (ut.type = "sell", j(), n("#sell").valid()) {
                var e = 0, t = parseFloat(r("sell-price").value) || 0, i = parseFloat(r("sell-amount").value) || 0;
                e += i * t, r("sell-sum").innerHTML = (e + (ut.sellFeeAmount || 0)).toFixed(8)
            }
        }), n(document).on("click", "#orders button", function (e) {
            var t = n(e.target).parent().parent().attr("id").substr(6);
            n.post("/trade/api/cancel", n.param({order_id: t, _csrf: csrf}),function (e) {
                "OK" == e.error ? (n("#order-error").hide(), n("#order-success").addClass("in"), n("#order-success span").html(e.message), n("#order-success").show()) : (n("#order-success").hide(), n("#order-error").addClass("in"), n("#order-error span").html(e.error), n("#order-error").show())
            }, "json").fail(function () {
                var e = "network connection error";
                n("#order-success").hide(), n("#order-error").addClass("in"), n("#order-error span").html(e), n("#order-error").show()
            })
        }), n("#trade .toggle").click(function () {
            n("#trade").slideUp("slow"), n("#instant").slideDown("slow")
        }), n("#instant .toggle").click(function () {
            n("#instant").slideUp("slow"), n("#trade").slideDown("slow")
        });
        var kt = Date.now()
    }), function () {
        this.pure_draggable = function (e, t) {
            function n(n) {
                if (startX = document.all ? window.event.clientX : n.pageX, startY = document.all ? window.event.clientY : n.pageY, l = o.offsetLeft, u = o.offsetTop - 40, t.onDragStart && "function" == typeof t.onDragStart)try {
                    t.onDragStart(e, n)
                } catch (a) {
                }
                document.addEventListener("mousemove", i, !1), document.addEventListener("mouseup", r, !1), document.body.className = document.body.className + " notselectable"
            }

            function i(e) {
                a = document.all ? window.event.clientX : e.pageX, s = document.all ? window.event.clientY : e.pageY;
                var t = 0 > l + a - startX ? 0 : l + a - startX, n = 0 > u + s - startY ? 0 : u + s - startY;
                if (s = 0 > s ? 0 : s, null !== o) {
                    var i = window.innerHeight, r = window.innerWidth, c = t + o.clientWidth + 20 >= r ? r - o.clientWidth - 20 : t, d = n + o.clientHeight + 50 >= i ? i - o.clientHeight - 50 : n;
                    o.style.left = (0 > c ? 0 : c) + "px", o.style.top = (0 > d ? 0 : d) + "px"
                }
            }

            function r(n) {
                if (document.removeEventListener("mousemove", i, !1), document.removeEventListener("mouseup", r, !1), document.body.className = document.body.className.replace(" notselectable", ""), t.onDragEnd && "function" == typeof t.onDragEnd)try {
                    t.onDragEnd(e, n)
                } catch (o) {
                }
            }

            if (e) {
                t || (t = {});
                var o = e, a = 0, s = 0, l = 0, u = 0;
                if (t.dragClass && e.getElementsByClassName(t.dragClass)[0]) {
                    var c = e.getElementsByClassName(t.dragClass)[0];
                    c.addEventListener("mousedown", n, !1)
                } else e.addEventListener("mousedown", n, !1);
                return this._element = e, this
            }
        }
    }(), function () {
        this.pure_resizable = function (e, t) {
            function n(e) {
                s = e.clientX, l = e.clientY, d = o.offsetTop, h = o.offsetLeft, u = parseInt(document.defaultView.getComputedStyle(o).width, 10), c = parseInt(document.defaultView.getComputedStyle(o).height, 10), document.documentElement.addEventListener("mousemove", i, !1), document.documentElement.addEventListener("mouseup", r, !1), document.body.className = document.body.className + " notselectable"
            }

            function i(e) {
                var t = window.innerHeight, n = window.innerWidth, i = u + e.clientX - s < 0 ? 0 : u + e.clientX - s, r = c + e.clientY - l < 0 ? 0 : c + e.clientY - l;
                n >= h + i + 10 && (o.style.width = i + "px"), t >= d + r + 160 && (o.style.height = r + "px")
            }

            function r(e) {
                if (document.documentElement.removeEventListener("mousemove", i, !1), document.documentElement.removeEventListener("mouseup", r, !1), document.body.className = document.body.className.replace(" notselectable", ""), t.onStop && "function" == typeof t.onStop)try {
                    t.onStop(o, e)
                } catch (n) {
                }
            }

            var o = e;
            if (t || (t = {}), !o)return!1;
            o.className = o.className + " resizable";
            var a = document.createElement("div");
            a.className = "resizer", o.appendChild(a), a.addEventListener("mousedown", n, !1);
            var s, l, u, c, d, h;
            return this
        }
    }(), function (e) {
        e.fn.autoResize = function (t) {
            var n = e.extend({onResize: function () {
            }, animate: !0, animateDuration: 150, animateCallback: function () {
            }, extraSpace: 20, limit: 1e3}, t);
            return this.filter("textarea").each(function () {
                var t = e(this).css({"overflow-y": "hidden"}), i = t.height(), r = function () {
                    var n = t.clone().removeAttr("id").removeAttr("name").css({position: "absolute", top: 0, left: -9999}).attr("tabIndex", "-1").insertBefore(t);
                    return n.refresh = function () {
                        var n = ["height", "width", "lineHeight", "textDecoration", "letterSpacing"], i = {};
                        e.each(n, function (e, n) {
                            i[n] = t.css(n)
                        }), this.css(i)
                    }, n.refresh(), n
                }(), o = null, a = function () {
                    r.refresh(), r.height(0).val(e(this).val()).scrollTop(1e4);
                    var a = Math.max(r.scrollTop(), i) + n.extraSpace, s = e(this).add(r);
                    if (o !== a) {
                        if (o = a, a >= n.limit)return e(this).css("overflow-y", ""), void 0;
                        n.onResize.call(this, a), n.animate && "block" === t.css("display") ? s.stop().animate({height: a}, n.animateDuration, n.animateCallback) : s.height(a)
                    }
                };
                t.unbind(".dynSiz").bind("keyup.dynSiz", a).bind("keydown.dynSiz", a).bind("change.dynSiz", a).resize(a)
            }), this
        }
    }(jQuery)
}), define("trade", function () {
});
