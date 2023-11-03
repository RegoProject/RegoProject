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
	// secModal
	isSecModalOpen: false,
    trapSecCleanup: null,
    openSecModal() {
      this.isSecModalOpen = true
      this.trapSecCleanup = focusTrap(document.querySelector('#secModal'))
    },
    closeSecModal() {
      this.isSecModalOpen = false
      this.trapSecCleanup()
    },
	// trdModal
	isTrdModalOpen: false,
    trapTrdCleanup: null,
    openTrdModal() {
      this.isTrdModalOpen = true
      this.trapTrdCleanup = focusTrap(document.querySelector('#trdModal'))
    },
    closeTrdModal() {
      this.isTrdModalOpen = false
      this.trapTrdCleanup()
    },

	// fourModal
	isFourModalOpen: false,
    trapFourCleanup: null,
    openFourModal() {
      this.isFourModalOpen = true
      this.trapFourCleanup = focusTrap(document.querySelector('#fourModal'))
    },
    closeFourModal() {
      this.isFourModalOpen = false
      this.trapFourCleanup()
    },

  }
}
