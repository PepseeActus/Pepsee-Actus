import { Search } from './search.js';

$(document).ready(function() {

    // SEARCH
    const search = new Search();

    window.gc_params = {
        graphcomment_id: 'PepseeActus',
        fixed_header_height: 0,
    };

    let gc_params = {
        graphcomment_id: 'PepseeActus',
        overlay: {
            "width":480,
            "button":{"background":"#f35b5b","color":"#ffffff"}
        }
    };

    (function() {
        const gc = document.createElement('script'); gc.type = 'text/javascript'; gc.async = true;
        gc.src = 'https://graphcomment.com/js/integration.js?' + Math.round(Math.random() * 1e8);
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(gc);
    })();

    // BACK TO TOP
    const btn = $('#button');

    $(window).scroll(function() {
        if ($(window).scrollTop() > 300) {
        btn.addClass('show');
        } else {
        btn.removeClass('show');
        }
    });

    btn.on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({scrollTop:0}, '300');
    });

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
            beforeSend : function(xhr){
                $('#pepsee_filters').find('button').text('Ça filtre...');
            },
            success : function( data ){

                // when filter applied:
                // set the current page to 1
                pepsee_loadmore_params.current_page = 1;

                // set the new query parameters
                pepsee_loadmore_params.posts = data.posts;

                // set the new max page parameter
                pepsee_loadmore_params.max_page = data.max_page;

                // change the button label back
                $('#pepsee_filters').find('button').text('Appique le filtre');

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

    //PROGRESS BAR
    let progress = document.getElementById('progressbar');
    let totalHeight = document.body.scrollHeight - window.innerHeight;

    window.onscroll = function() {
        let progressHeight = (window.pageYOffset / totalHeight) * 100;
        progress.style.height = progressHeight + '%';
    }
});