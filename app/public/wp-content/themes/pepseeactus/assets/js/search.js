export class Search {
    // 1. describe and create/initiate our object
    constructor() {
        this.addSearchHTML();
        this.resultsDiv = $("#search-overlay__results");
        this.openButton = $(".js-search-trigger");
        this.closeButton = $(".search-overlay__close");
        this.searchOverlay = $(".search-overlay");
        this.searchField = $("#search-term");
        this.events();
        this.isOverlayOpen = false;
        this.isSpinnerVisible = false;
        this.previousValue;
        this.typingTimer;
    }

    // 2. events
    events() {
        this.openButton.on("click", this.openOverlay.bind(this));
        this.closeButton.on("click", this.closeOverlay.bind(this));
        $(document).on("keydown", this.keyPressDispatcher.bind(this));
        this.searchField.on("keyup", this.typingLogic.bind(this));
    }

    // 3. methods (function, action...)
    typingLogic() {
        if (this.searchField.val() != this.previousValue) {
            clearTimeout(this.typingTimer);

            if (this.searchField.val()) {
                if (!this.isSpinnerVisible) {
                    this.resultsDiv.html('<div class="spinner-loader"></div>');
                    this.isSpinnerVisible = true;
                }
                this.typingTimer = setTimeout(this.getResults.bind(this), 750);
            } else {
                this.resultsDiv.html('');
                this.isSpinnerVisible = false;
            }
        }
        this.previousValue = this.searchField.val();
    }

    getResults() {
        $.getJSON(pepseeData.root_url + '/wp-json/pepsee/v1/search?term=' + this.searchField.val(), (results) => {
            this.resultsDiv.html(`
                <div class="row">
                    <div class="col-12 col-md-3">
                        <h2 class="search-overlay__section-title">Artistes</h2>
                        ${results.artist.length ? '<ul>' : "<p>Aucun artiste ne correspond à cette recherche.</p>"}
                            ${results.artist.map(item => `
                                </li>
                                    <div class="artist-card">
                                        <div class="artist-image">
                                        <a href="${item.permalink}"><img src="${item.image}" alt="${item.title}"></a>
                                        </div>
                                        <div class="artist-info">
                                            <a href="${item.permalink}">${item.title}</a>
                                        </div>
                                    </div>
                                <li>
                            `).join('')}
                        ${results.artist.length ? '</ul>' : ''}
                    </div>  
                    <div class="col-12 col-md-5">
                        <h2 class="search-overlay__section-title">Actus</h2>
                        ${results.generalInfo.length ? '<ul>' : '<p>Aucune actu ne correspond à cette recherche.</p>'}
                            ${results.generalInfo.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.generalInfo.length ? '</ul>' : ''}
                    </div>  
                    <div class="col-12 col-md-4">
                        <h2 class="search-overlay__section-title">Singles</h2>
                        ${results.music.length ? '<ul>' : '<p>Aucun single ne correspond à cette recherche.</p>'}
                            ${results.music.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.music.length ? '</ul>' : ''}
                        <h2 class="search-overlay__section-title">Albums</h2>
                        ${results.album.length ? '<ul>' : '<p>Aucun album ne correspond à cette recherche.</p>'}
                            ${results.album.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.album.length ? '</ul>' : ''}
                    </div>  
                </div>
            `);
        });
    }

    keyPressDispatcher(e) {
        if (e.keyCode == 83 && !this.isOverlayOpen && !$("input, textarea").is(':focus')) {
            this.openOverlay();
        }
        if (e.keyCode == 27 && this.isOverlayOpen) {
            this.closeOverlay();
        }
    }

    openOverlay() {
        this.searchOverlay.addClass("search-overlay--active");
        $("body").addClass("body-no-scroll");
        $(".mobile-nav").hide();
        this.searchField.val('');
        setTimeout(() => this.searchField.focus(), 301);
        this.isOverlayOpen = true;
    }

    closeOverlay() {
        this.searchOverlay.removeClass("search-overlay--active");
        $("body").removeClass("body-no-scroll");
        $(".mobile-nav").show();
        this.isOverlayOpen = false;
    }

    addSearchHTML() {
        $("body").append(`
            <div class="search-overlay">
                <div class="search-overlay__top">
                    <div class="container">
                        <i class="fa fa-search search-overlay__icon" aria-hidden="true"></i>
                        <input type="text" class="search-term" placeholder="Sa ou ka chèché?" id="search-term">
                        <svg class="search-overlay__close" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 393.765 393.765" xml:space="preserve">
                            <path d="M288.805,196.399L392.668,91.44L300.263,0L196.4,104.959L91.44,1.097L0,93.502l104.959,103.863L1.097,302.324l92.405,91.44
                                l103.863-104.959l104.959,103.863l91.44-92.405L288.805,196.399z M302.102,350.242L197.142,246.379L93.279,351.339l-49.757-49.237
                                l103.863-104.959L42.426,93.279l49.237-49.757l104.959,103.863L300.485,42.426l49.757,49.237L246.379,196.622l104.959,103.863
                                L302.102,350.242z"/>
                        </svg>
                    </div>
                </div>
                <div class="container">
                    <div id="search-overlay__results"></div>
                </div>
            </div>
        `);
    }
}
