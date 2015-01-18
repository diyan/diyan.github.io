+++
date = "2015-01-15T00:17:33+02:00"
draft = false
title = "On Virtual DOM, FRP, Hyperscript"

+++

In the late 2014 I decided to take a look at bleeding edge JavaScript frameworks.

From time to time I'm hearing new buzzwords and maybe the most often was ReactJS, so I decided to take a short look on a few modern frameworks and libraries.

It worth mention that one thing is really conserns we in ReactJS. It's JSX - a mix of JavaScript and HTML, the new language.

So, I was really happy to see a [Hyperscript](https://github.com/dominictarr/hyperscript) - nice JavaScript DSL for building HTML documents. It uses just regular JavaScript, no fancy additions. 

It's clear what kind HTML it will produce and we have no issues with text editors, code analysers, parsers and other dev tools.

I need to be sure that Hyperscript would not isolate me in any way, so I've searched a number of libraries which covers all common use cases that you may encounter:

- [react-hyperscript](https://www.npmjs.com/package/react-hyperscript) - to use Hyperscript syntax in ReactJS app
- [virtual-dom-stringify](https://www.npmjs.com/package/virtual-dom-stringify) - to turn a DOM node into a virtual-dom tree
- [vdom-virtualize](https://www.npmjs.com/package/vdom-virtualize) - to turn a DOM node / HTML string into a virtual-dom tree
- [virtual-dom-jsx](https://www.npmjs.com/package/virtual-dom-jsx) - transpiler from JSX to virtual-hyperscript code
- [vtree-select](https://www.npmjs.com/package/vtree-select) - to use CSS selector with virtual-dom nodes

Thankfully to ReactJS I've got familiar with Virtual DOM concept. Also I'm really glad that Facebook's ReactJS moving forward popularity of Functional Reactive Programming (FRP) paradigm. 

Most likely I could miss a number JavaScript libraries that exposes Virtual DOM and/or Hyperscript DSL but what I've found are following: 

- [Virtual DOM](https://github.com/Matt-Esch/virtual-dom/blob/master/virtual-hyperscript/README.md) - base library that provides Virtual DOM API and Hyperscript DSL for more high level frameworks
- [Mithril](http://lhorie.github.io/mithril/index.html) - IE6+, no deps, Virtual DOM concept. 2434 stars, 183 forks on GitHub
- [Mercury](https://github.com/Raynos/mercury) -  IE9+, based on virtual-dom lib and observ-struct. FRP. 1128 stars, 49 forks
- [VueJS](http://vuejs.org/) - IE9+, MVVM, Virtual DOM concept. 3327 stars, 268 forks
- [CycleJS](https://github.com/staltz/cycle) - browser compatibility unclear, based on virtual-dom and RxJS libs. FRP. 387 stars, 9 forks

Mithrill looks attractive if you need a framework with minimal footprint, wide browser support and traditional approach for templating.

At the same time it's data binding looks a bit weird. Not sure but this could be a trade off for deciding to support IE6 (and saying "no" to JavaScript getters/setters).

Mercury is the most interesting framework for me. It contains a number of interesting concepts that I know in theory but eager to try in practice.

[Here](https://github.com/Raynos/mercury/blob/master/docs/modules/README.md) you can find a very good documentation that explains a lot implementation details, I would reccomend you pay attention on vdom-thunk, main-loop and time-travel.

In samples you can find an [annoying](https://github.com/Raynos/mercury/blob/2048-wip/examples/2048/state.js#L26-L34) mapping from plain JavaScript object to Mercury's observ. Unfortunately this is something you have to deal with. I remember my happines when I saw how KnockoutJS opened FRP to the JavaScript world and then my sadness after I wrote a lot of boilerplate code that maps plain objects to observables.

Fortunately there is [oservify](https://github.com/maxogden/observify) - an automapper from plain JavaScript objects to Mercury's observ.

VueJS is a way to go if you need a Virtual DOM-powered version of AngularJS. This frameworks is rapidly gaining stars/forks on GitHub and soon we may see it in line with other top JavaScript frameworks.

CycleJS does not have too much popularity now and not likely it will. But author did a very important step - it included full-blown general purpose library RxJS that exposes all power of FRP / Reactive Programming to application framework.

At the end here is a link to [benchmark](http://jsperf.com/angular-vs-knockout-vs-ember/401) between popular JavaScript frameworks and hopefully you'll see how Virtual DOM-based frameworks kicks ass to all others.

Thats all. Looking forward for your comments on Google+.