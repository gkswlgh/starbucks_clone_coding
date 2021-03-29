/**
 * main page contents : 본문 영역
 */

$(document).ready(function() {
    $(function() {
        $(".slogan_btn a").hover(
            function() {
                $(".slogan_btn a").css({
                    color: '#fff',
                    background: 'rgb(127,75,63)'
                });
            },
            function() {
                $(".slogan_btn a").css({
                    color: '#fff',
                    background: 'transparent'
                });
            }
        );
        $(".bean_detail_btn a, .store_btn a").hover(
            function() {
                $(".bean_detail_btn a, .store_btn a").css({
                    color: '#fff',
                    background: '#000'
                });
            },
            function() {
                $(".bean_detail_btn a, .store_btn a").css({
                    color: '#555',
                    background: 'transparent'
                });
            }
        );

        $(".prom_inner_btn a").hover(
            function() {
                $(".prom_inner_btn a").css({
                    color: '#fff',
                    background: '#000'
                });
            },
            function() {
                $(".prom_inner_btn a").css({
                    color: '#222',
                    background: 'transparent'
                });
            }
        );
        $(".reserve_detail_btn a").hover(
            function() {
                $(".reserve_detail_btn a").css({
                    color: '#fff',
                    background: '#682c11'
                });
            },
            function() {
                $(".reserve_detail_btn a").css({
                    color: '#682c11',
                    background: 'transparent'
                });
            }
        );

        $(".menu_wrap_btn a").hover(
            function() {
                $(".menu_wrap_btn a").css({
                    color: '#000',
                    background: '#fff'
                });
            },
            function() {
                $(".menu_wrap_btn a").css({
                    color: '#fff',
                    background: 'transparent'
                });
            }
        );

        $(".magazine_detail_btn a").hover(
            function() {
                $(".magazine_detail_btn").css({
                    background: 'rgb(151,109,63)'
                });
            },
            function() {
                $(".magazine_detail_btn").css({
                    background: 'transparent'
                });
            }
        );
    });

    $(function() {
        /*fadeIn*/
        //메인비주얼
        $(".set_01").animateCSS('fadeIn', { duration: 800, delay: 500 });
        $(".set_02").animateCSS('fadeIn', { duration: 800, delay: 1000 });
        $(".set_03").animateCSS('fadeIn', { duration: 800, delay: 1500 });
        $(".main_visual_slogan img").animateCSS('fadeIn', { duration: 800, delay: 150 });
        $(".slogan_btn").animateCSS('fadeIn', { duration: 800, delay: 2000 });
        //리서브
        $(".reserve_visual").animateCSS('fadeIn', { duration: 2000 });
        $(".reserve_ttl").animateCSS('fadeIn', { duration: 2000, delay: 500 });
        $(".reserve_detail_btn").animateCSS('fadeIn', { duration: 2000, delay: 1000 });
        //매장랩
        $(".store_exp_img01").animateCSS('fadeIn', { duration: 800 });
        $(".store_exp_img02").animateCSS('fadeIn', { duration: 800 });
        $(".store_btn").animateCSS('fadeIn', { duration: 1000 });
        //메뉴랩
        $(".menu_wrap_btn").animateCSS('fadeIn', { duration: 2200 });

        /*fadeInLeft&Right*/
        //메인빈
        $(".bean_img_box").animateCSS('fadeInLeft', { duration: 1500, delay: 600 });
        $(".bean_txt_box").animateCSS('fadeInRight', { duration: 1500, delay: 600 });
        //메뉴랩
        $(".menu_wrap_txt01").animateCSS('fadeInLeft', { duration: 2200, delay: 600 });
        $(".menu_wrap_txt02").animateCSS('fadeInLeft', { duration: 2200, delay: 600 });
    });

    $(window).on('mousewheel', function(e) {
        var wheel = e.originalEvent.wheelDelta;
        var sHeight = $(document).scrollTop();

        if (wheel <= 0) { //scroll 내렸을 때
            if (sHeight > 0) {
                //메인빈
                $(".bean_img_box").stop().animateCSS('fadeInLeft', { duration: 1500 });
                $(".bean_txt_box").stop().animateCSS('fadeInRight', { duration: 1500 });

                //메뉴랩
                $(".menu_wrap_txt01").stop().animateCSS('fadeInLeft', { duration: 1600 });
                $(".menu_wrap_txt02").stop().animateCSS('fadeInLeft', { duration: 1600 });
            }
        } else {
            if (sHeight > 0) {
                $(".menu_wrap_txt01").stop().animateCSS('fadeOutLeft', { duration: 1200 });
                $(".menu_wrap_txt02").stop().animateCSS('fadeOutLeft', { duration: 1200 });
            }
        }
    });


    $('.news_result').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        vertical: true
    });


    $('.prom_slider_list').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        dots: true
    });

    $(".prom_btn").on('click', function(e) {
        e.preventDefault();
        var $btn = $("#prom_btn_toggle");
        if ($btn.hasClass('open')) {
            $btn.removeClass('open');
            $btn.addClass('close');
        } else {
            $btn.removeClass('close');
            $btn.addClass('open');
        }

        $(".prom_banner").slideToggle(300);
    });

});