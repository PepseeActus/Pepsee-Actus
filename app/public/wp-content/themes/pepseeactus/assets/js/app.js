import { Search } from './search.js';

$(document).ready(function() {
    // SEARCH
    const search = new Search();

    // SWIPER
    if ($('.swiper-actus').length > 0) {
        console.log($('.swiper-actus').length);
        
        const actusSwiper = new Swiper('.swiper-actus', {
            slidesPerView: 2,
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                992: {
                    slidesPerView: 4,
                    spaceBetween: 20
                },
            }
        });
    }

    // MOUSE EFFECT ON SINGLE TITLE
    let mouseX, mouseY;
    let ww = $( window ).width();
    let wh = $( window ).height();
    let traX, traY;
    $(document).mousemove(function(e){
        mouseX = e.pageX;
        mouseY = e.pageY;
        traX = ((4 * mouseX) / 570) + 40;
        traY = ((4 * mouseY) / 570) + 50;
        $(".hero-banner .info").css({"background-position": traX + "%" + traY + "%"});
    });

    //AJAX MUSIQUE
    $('#pepsee_loadmore').click(function(){

        $.ajax({
            url : pepsee_loadmore_params.ajaxurl, // AJAX handler
            data : {
                'action': 'loadmorebutton', // the parameter for admin-ajax.php
                'query': pepsee_loadmore_params.posts, // loop parameters passed by wp_localize_script()
                'page' : pepsee_loadmore_params.current_page // current page
            },
            type : 'POST',
            beforeSend : function ( xhr ) {
                $('#pepsee_loadmore').text('Loading...'); // some type of preloader
            },
            success : function( posts ){
                if( posts ) {

                    $('#pepsee_loadmore').text( 'Plus de sons' );
                    $('#pepsee_posts_wrap').append( posts ); // insert new posts
                    pepsee_loadmore_params.current_page++;

                    if ( pepsee_loadmore_params.current_page == pepsee_loadmore_params.max_page ) 
                        $('#pepsee_loadmore').hide(); // if last page, HIDE the button

                } else {
                    $('#pepsee_loadmore').hide(); // if no data, HIDE the button as well
                }
            }
        });
        return false;
    });

    // FILTRE DE LA PAGE MUSIQUE
    $('#pepsee_number_of_results, #pepsee_year, #pepsee_order_by').change(function(){

        $.ajax({
            url : pepsee_loadmore_params.ajaxurl,
            data : $('#pepsee_filters').serialize(), // form data
            dataType : 'json', // this data type allows us to receive objects from the server
            type : 'POST',
            success : function( data ){

                // when filter applied:
                // set the current page to 1
                pepsee_loadmore_params.current_page = 1;

                // set the new query parameters
                pepsee_loadmore_params.posts = data.posts;

                // set the new max page parameter
                pepsee_loadmore_params.max_page = data.max_page;

                // insert the posts to the container
                $('#pepsee_posts_wrap').html(data.content);

                // hide load more button, if there are not enough posts for the second page
                if ( data.max_page < 2 ) {
                    $('#pepsee_loadmore').hide();
                } else {
                    $('#pepsee_loadmore').show();
                }
            }
        });

        // do not submit the form
        return false;
    });

    // PROGRESS BAR
    let progress = document.getElementById('progressbar');
    let totalHeight = document.body.scrollHeight - window.innerHeight;
    window.onscroll = function() {
        let progressHeight = (window.pageYOffset / totalHeight) * 100;
        progress.style.height = progressHeight + '%';
    }

    //RETIRE LE NOM DE L'ARTISTE DANS LE NOM DE L'ALBUM
    const text = $('.related-album a').text();
    const album = text.split("–")[1];
    $('.related-album a').text(album);

    //SEE MORE BIO DES ARTISTES
    var readmore = document.querySelectorAll(".readmore-link a");
    for (var i = 0; i < readmore.length; i++) {
        var el = readmore[i];
        el.onclick = function() {

            let readmoreContainer = el.closest("div");
            readmoreContainer.classList.toggle("open");

            let lable = (el.innerHTML === "Voir plus") ? "Voir moins" : "Voir plus";
            el.innerHTML = lable;

            return false;
        };
    }

    //CACHER LES VISUELS D'ARTISTES QUAND ILS SONT TROP NOMBREUX (PAGE MUSIQUE)
    if ( $('.artist-image__container .artist-image').length > 4 ) {
        $('.artist-image__container .artist-image').slice(4).hide();
        $('.artist-image__container').append('<div class="artist-image last"></div>')
    }
    $('.artist-image.last').on('click', function () {
        $('.artist-image__container .artist-image').show();
        $('.artist-image.last').hide();
    });

    // NAV MOBILE
    $("#navbar").on("click touchstart", function() {
        $(".nveMenu").addClass("is-opened");
        $(".overlay").addClass("is-on");
        $(".close-nav-menu ").addClass("is-on");
        $(".site-header").hide();
    });
    $(".overlay").on("click touchstart", function() {
        $(this).removeClass("is-on");
        $(".close-nav-menu ").removeClass("is-on");
        $(".nveMenu").removeClass("is-opened");
        $(".site-header").show();
    });
});