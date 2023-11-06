function data() {
	function getThemeFromLocalStorage() {
		// if user already changed the theme, use it
		if (window.localStorage.getItem('dark')) {
			return JSON.parse(window.localStorage.getItem('dark'))
		}

		// else return their preferences
		return (
			!!window.matchMedia &&
			window.matchMedia('(prefers-color-scheme: dark)').matches
		)
	}

	function setThemeToLocalStorage(value) {
		window.localStorage.setItem('dark', value)
	}

	return {
		dark: getThemeFromLocalStorage(),
		toggleTheme() {
			this.dark = !this.dark
			setThemeToLocalStorage(this.dark)
		},
		isSideMenuOpen: false,
		toggleSideMenu() {
			this.isSideMenuOpen = !this.isSideMenuOpen
		},
		closeSideMenu() {
			this.isSideMenuOpen = false
		},
		isNotificationsMenuOpen: false,
		toggleNotificationsMenu() {
			this.isNotificationsMenuOpen = !this.isNotificationsMenuOpen
		},
		closeNotificationsMenu() {
			this.isNotificationsMenuOpen = false
		},
		isProfileMenuOpen: false,
		toggleProfileMenu() {
			this.isProfileMenuOpen = !this.isProfileMenuOpen
		},
		closeProfileMenu() {
			this.isProfileMenuOpen = false
		},
		isPagesMenuOpen: false,
		togglePagesMenu() {
			this.isPagesMenuOpen = !this.isPagesMenuOpen
		},
		// Modal
		isModalOpen: false,
		trapCleanup: null,
		openModal() {
			this.isModalOpen = true
			this.trapCleanup = focusTrap(document.querySelector('#modal'))
		},
		closeModal() {
			this.isModalOpen = false
			this.trapCleanup()
		},
	}
}


/* Please ❤ this if you like it! */


(function ($) {
	"use strict";

	$(function () {
		var header = $(".start-style");
		$(window).scroll(function () {
			var scroll = $(window).scrollTop();

			if (scroll >= 10) {
				header.removeClass('start-style').addClass("scroll-on");
			} else {
				header.removeClass("scroll-on").addClass('start-style');
			}
		});
	});

	//Animation

	$(document).ready(function () {
		$('body.hero-anime').removeClass('hero-anime');
	});

	//Menu On Hover

	$('body').on('mouseenter mouseleave', '.nav-item', function (e) {
		if ($(window).width() > 750) {
			var _d = $(e.target).closest('.nav-item'); _d.addClass('show');
			setTimeout(function () {
				_d[_d.is(':hover') ? 'addClass' : 'removeClass']('show');
			}, 1);
		}
	});

	//Switch light/dark

	$("#switch").on('click', function () {
		if ($("body").hasClass("dark")) {
			$("body").removeClass("dark");
			$("#switch").removeClass("switched");
		}
		else {
			$("body").addClass("dark");
			$("#switch").addClass("switched");
		}
	});

})(jQuery);

