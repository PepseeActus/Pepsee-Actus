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
                        ${results.artist.length ? '<ul class="search-result-artist-list">' : "<p>Aucun artiste ne correspond à cette recherche.</p>"}
                            ${results.artist.map(item => `
                                <li class="search-result-artist-list__item">
                                    <div class="artist-card">
                                        <div class="artist-image">
                                        <a href="${item.permalink}"><img src="${item.image}" alt="${item.title}"></a>
                                        </div>
                                        <div class="associated-artist__info search-result-artist__info">
                                            <a href="${item.permalink}">${item.title}</a>
                                        </div>
                                    </div>
                                </li>
                            `).join('')}
                        ${results.artist.length ? '</ul>' : ''}
                        <h2 class="search-overlay__section-title">Beatmakers</h2>
                        ${results.beatmaker.length ? '<ul class="search-result-artist-list">' : "<p>Aucun beatmaker ne correspond à cette recherche.</p>"}
                            ${results.beatmaker.map(item => `
                                <li class="search-result-artist-list__item">
                                    <div class="artist-card">
                                        <div class="artist-image">
                                        <a href="${item.permalink}"><img src="${item.image}" alt="${item.title}"></a>
                                        </div>
                                        <div class="associated-artist__info search-result-artist__info">
                                            <a href="${item.permalink}">${item.title}</a>
                                        </div>
                                    </div>
                                </li>
                            `).join('')}
                        ${results.beatmaker.length ? '</ul>' : ''}
                    </div>  
                    <div class="col-12 col-md-3">
                        <h2 class="search-overlay__section-title">Singles</h2>
                        ${results.music.length ? '<ul>' : '<p>Aucun single ne correspond à cette recherche.</p>'}
                            ${results.music.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.music.length ? '</ul>' : ''}
                    </div>  
                    <div class="col-12 col-md-3">
                        <h2 class="search-overlay__section-title">Albums</h2>
                        ${results.album.length ? '<ul>' : '<p>Aucun album ne correspond à cette recherche.</p>'}
                            ${results.album.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.album.length ? '</ul>' : ''}
                        <h2 class="search-overlay__section-title">Actus</h2>
                        ${results.generalInfo.length ? '<ul>' : '<p>Aucune actu ne correspond à cette recherche.</p>'}
                            ${results.generalInfo.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.generalInfo.length ? '</ul>' : ''}
                    </div>  
                    <div class="col-12 col-md-3">
                        <h2 class="search-overlay__section-title">Riddims</h2>
                        ${results.riddim.length ? '<ul>' : '<p>Aucun riddim ne correspond à cette recherche.</p>'}
                            ${results.riddim.map(item => `<li><a href="${item.permalink}">- ${item.title}</a></li>`).join('')}
                        ${results.riddim.length ? '</ul>' : ''}
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
        this.searchField.val('');
        setTimeout(() => this.searchField.focus(), 301);
        this.isOverlayOpen = true;
    }

    closeOverlay() {
        this.searchOverlay.removeClass("search-overlay--active");
        $("body").removeClass("body-no-scroll");
        this.isOverlayOpen = false;
    }

    addSearchHTML() {
        $("body").append(`
            <div class="search-overlay">
                <div class="search-overlay__top">
                    <div class="container">
                        <i class="fa fa-search search-overlay__icon" aria-hidden="true"></i>
                        <input type="text" class="search-term" placeholder="Sa ou ka chèché?" id="search-term">
                        <button type="button" class="search-overlay__close" aria-label="Fermer la recherche">
                            <svg class="search-overlay__close-icon" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                viewBox="0 0 393.765 393.765" xml:space="preserve">
                                <path d="M288.805,196.399L392.668,91.44L300.263,0L196.4,104.959L91.44,1.097L0,93.502l104.959,103.863L1.097,302.324l92.405,91.44
                                    l103.863-104.959l104.959,103.863l91.44-92.405L288.805,196.399z M302.102,350.242L197.142,246.379L93.279,351.339l-49.757-49.237
                                    l103.863-104.959L42.426,93.279l49.237-49.757l104.959,103.863L300.485,42.426l49.757,49.237L246.379,196.622l104.959,103.863
                                    L302.102,350.242z"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <div style="padding:0 20px;">
                    <div id="search-overlay__results" class="is-dark"></div>
                </div>
            </div>
        `);
    }
}
