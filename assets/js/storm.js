// Storm site chrome behaviour. Vanilla JS — no jQuery, no Bootstrap plugins.
(function () {
	'use strict';

	function ready(fn) {
		if (document.readyState !== 'loading') { fn(); return; }
		document.addEventListener('DOMContentLoaded', fn);
	}

	ready(function () {
		setupScrollToTop();
		setupAffix();
		highlightCurrentNav();
	});

	function setupScrollToTop() {
		var btn = document.querySelector('.totop');
		if (!btn) return;
		btn.style.display = 'none';
		var link = btn.querySelector('a');

		window.addEventListener('scroll', function () {
			btn.style.display = window.scrollY > 300 ? '' : 'none';
		}, { passive: true });

		if (link) {
			link.addEventListener('click', function (e) {
				e.preventDefault();
				window.scrollTo({ top: 0, behavior: 'smooth' });
			});
		}
	}

	function setupAffix() {
		var navbar = document.querySelector('.navbar');
		var header = document.querySelector('header');
		if (!navbar || !header) return;
		var threshold = header.offsetHeight;

		function update() {
			navbar.classList.toggle('affix', window.scrollY > threshold);
		}
		update();
		window.addEventListener('scroll', update, { passive: true });
		window.addEventListener('resize', function () {
			threshold = header.offsetHeight;
			update();
		}, { passive: true });
	}

	function highlightCurrentNav() {
		var url = document.URL;
		var navLinks = document.querySelectorAll('.navbar a');
		var matched = false;

		navLinks.forEach(function (a) {
			var href = a.getAttribute('href');
			if (href && href !== '#' && href !== '/' && url.indexOf(href) > 0) {
				a.classList.add('current');
				matched = true;
			}
		});

		if (url.indexOf('/documentation/') > 0 || url.indexOf('/releases/') > 0) {
			navLinks.forEach(function (a) { a.classList.remove('current'); });
			var doc = document.getElementById('documentation');
			if (doc) doc.classList.add('current');
			matched = true;
		}
		if (url.indexOf('/contribute/') > 0 || url.indexOf('/team/') > 0) {
			navLinks.forEach(function (a) { a.classList.remove('current'); });
			var community = document.getElementById('community');
			if (community) community.classList.add('current');
			matched = true;
		}

		var newsList = document.querySelectorAll('#news-list li a');
		newsList.forEach(function (a) {
			var href = a.getAttribute('href');
			if (href && url.indexOf(href) > 0) {
				newsList.forEach(function (x) { x.classList.remove('current'); });
				a.classList.add('current');
			}
		});

		// suppress unused warning when no match — keeps function future-proof
		void matched;
	}
})();
