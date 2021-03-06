var Ui = ( function( $ ) {

	$.fn.slider = function( settings ){
		return this.each( function(i) {
			var options = $.extend( {
				fade: false,
				speed: 500,
				controls: true,
				paging: true,
				infinite: true,
				index: 0,
				autoplay: false,
				autoplaySpeed: 5000,
				multiple: false,
				draggable: false,
				progress: false,
			}, settings );

			var $slider = $(this),
				nameSpace = $(this).attr('class');

			if ( settings === 'destroy' ) {
				$( window ).off( 'resize.'+nameSpace, sliderSet );
				setTimeout( function() {
					$slider.off().find( '.clone' ).remove();
					$slider.find('ul, li').removeAttr( 'style' );
					$slider.removeData( 'options' );
				} );
				return false;
			}

			var $sliderList = $slider.children().first(),
				$slideItem = $sliderList.children(),
				itemLength = $slideItem.length,
				listWidth = 100 * itemLength + '%',
				itemWidth = 100 / itemLength + '%',
				translateX = ( 100 / itemLength ) * options.index + '%',
				gutter = parseInt( $slideItem.css( 'margin-right' ) );

			options.index = $slider.attr( 'data-index' ) ? parseInt( $slider.attr( 'data-index' ) ) : options.index;
			options = $slider.data( 'options' ) ? $slider.data( 'options' ) : options;

			if ( itemLength > 1 ) {
				if ( options.infinite ) {
					if ( ! $sliderList.find( '.clone' ).length ) {
						$firstItem = $slideItem.first().clone().addClass( 'clone' );
						$lastItem = $slideItem.last().clone().addClass( 'clone' );

						$firstItem.appendTo( $sliderList );
						$lastItem.prependTo( $sliderList );

						options.index = options.index + 1;
						$slideItem = $sliderList.children();
						itemLength = $slideItem.length;
					}
				}

				function sliderSet() {
					$slideItem.removeAttr( 'style' );
					$slider.data( 'options', options );

					listWidth = 100 * itemLength + '%';
					itemWidth = 100 / itemLength + '%';
					translateX = -( 100 / itemLength ) * options.index + '%';
					gutter = parseInt( $slideItem.css( 'margin-right' ) );

					if ( options.multiple ) {
						itemWidth = $slideItem.width();
						translateX = - ( ( itemWidth + gutter ) * options.index ) + 'px';
						listWidth = ( itemWidth + gutter ) * itemLength;

						if ( Math.abs( parseInt( translateX ) ) > listWidth - $sliderList.parent().width() ) {
							translateX = options.index > 0 ? - ( listWidth - $sliderList.parent().width() - gutter ) + 'px' : '0px';
						}
					}

					if ( options.fade && ! options.multiple ) {
						$slideItem.css( {
							'position': 'absolute',
							'top': 0,
							'left': 0,
							'opacity': 0,
							'width': '100%',
							'transition-duration': '0ms',
						} ).eq( options.index ).css( 'opacity', '1' );
					} else {
						$sliderList.css( {
							'width': listWidth,
							'transition-duration': '0ms',
							'transform': 'translateX( ' + translateX + ' )',
						} );

						$slideItem.css( {
							'float': 'left',
							'width': itemWidth,
						} );
					}
				}

				function adaptiveHeight() {
					$sliderList.css( {
						'height': $slideItem.eq( options.index ).height(),
					} ).find( 'img' ).load( function() {
						$sliderList.height( $slideItem.eq( options.index ).height() );
					} );

					setTimeout( function() {
						$sliderList.css( {
							'height': $slideItem.eq( options.index ).height(),
							'transition-duration': '300ms',
						} );
					}, 500 );
				}

				function prevAction() {
					if ( options.infinite && options.index  === 0 ) {
						options.index = itemLength-2;
						if ( ! options.fade ) {
							$sliderList.css( {
								'transition-duration': '0ms',
								'transform': 'translateX( -' + ( 100 / itemLength ) * options.index +'% )',
							} );
						}
					}

					if ( options.infinite ) {
						options.index = options.index > 0 ? options.index-1 : itemLength-1;
					} else {
						options.index = options.index > 0 ? options.index-1 : 0;
					}

					setTimeout( function() {
						var translateX = -( ( 100 / itemLength ) * options.index ) + '%';

						if ( options.multiple ) {
							translateX = -( ( $slideItem.width() + gutter ) * options.index ) + 'px';

							if ( Math.abs( parseInt( translateX ) ) > listWidth - $sliderList.parent().width() ) {
								translateX = - ( listWidth - $sliderList.parent().width() - gutter ) + 'px';
							}

							translateX = $sliderList.width() < $sliderList.parent().width() ? 0 : translateX;
						}

						if ( options.fade && ! options.multiple ) {
							$slideItem.css( {
								'opacity': '0',
								'transition-duration': options.speed + 'ms',
							 } ).eq( options.index ).css( 'opacity', '1' );
						} else {
							$sliderList.css( {
								'transition-duration': options.speed + 'ms',
								'transform': 'translateX( ' + translateX + ' )',
							} );
						}

						adaptiveHeight();
						slideCurrent( options.index );
						controlsDisable( options.index );
						pagingCurrent( options.index );
					}, 10 );
				}

				function nextAction() {
					if ( options.infinite && options.index > itemLength-2 ) {
						options.index = 1;
						if ( ! options.fade ) {
							$sliderList.css( {
								'transition-duration': '0ms',
								'transform': 'translateX( -' + ( 100 / itemLength ) * options.index +'% )',
							} );
						}
					}

					if ( options.infinite ) {
						options.index = options.index < itemLength-1 ? options.index+1 : 0;
					} else {
						options.index = options.index < itemLength-1 ? options.index+1 : itemLength-1;
					}

					setTimeout( function() {
						var translateX = -( ( 100 / itemLength ) * options.index ) + '%';

						if ( options.multiple ) {
							translateX = -( ( itemWidth + gutter ) * options.index ) + 'px';

							if ( Math.abs( parseInt( translateX ) ) > listWidth - $sliderList.parent().width() ) {
								translateX = - ( listWidth - $sliderList.parent().width() - gutter ) + 'px';
							}

							translateX = $sliderList.width() < $sliderList.parent().width() ? 0 : translateX;
						}

						if ( options.fade ) {
							$slideItem.css( {
								'opacity': '0',
								'transition-duration': options.speed + 'ms',
							 } ).eq( options.index ).css( 'opacity', '1' );
						} else {
							$sliderList.css( {
								'transition-duration': options.speed + 'ms',
								'transform': 'translateX( ' + translateX + ' )',
							} );
						}

						adaptiveHeight();
						slideCurrent( options.index );
						controlsDisable( options.index );
						pagingCurrent( options.index );
					}, 10 );
				}

				function pagingAction( index ){
					options.index = options.infinite ? index + 1 : index;

					var translateX = -( ( 100 / itemLength ) * options.index ) + '%';

					if ( options.multiple ) {
						translateX = -( ( itemWidth + gutter ) * options.index ) + 'px';

						if ( Math.abs( parseInt( translateX ) ) > listWidth - $sliderList.parent().width() ) {
							translateX = - ( listWidth - $sliderList.parent().width() - gutter ) + 'px';
						}

						translateX = $sliderList.width() < $sliderList.parent().width() ? 0 : translateX;
					}

					if ( options.fade ) {
						$slideItem.css( {
							'opacity': '0',
							'transition-duration': options.speed + 'ms',
						} ).eq( options.index ).css( 'opacity', '1' );
					} else {
						$sliderList.css( {
							'transition-duration': options.speed + 'ms',
							'transform': 'translateX( ' + translateX + ' )',
						} );
					}

					adaptiveHeight();
					slideCurrent( options.index );
					pagingCurrent( options.index );
				}

				function controlsDisable( index ) {
					if ( options.infinite ) return false;

					if ( index === 0 ) {
						$slider.find( '.prev' ).attr( 'disabled', true );
						$slider.find( '.next' ).attr( 'disabled', false );
					} else if ( index === itemLength-1 ){
						$slider.find( '.prev' ).attr( 'disabled', false );
						$slider.find( '.next' ).attr( 'disabled', true );
					} else {
						$slider.find( '.prev, .next' ).attr( 'disabled', false );
					}
				}

				function slideCurrent( index ) {
					$slideItem.removeClass( 'current' ).css( 'z-index', '0' ).eq( index ).addClass( 'current' ).css( 'z-index', '10' );
				}

				function pagingCurrent( index ) {
					if ( $slider.find('.paging').length ) {
						index = options.infinite && index > itemLength-2 ? 0 : index-1;
						$slider.find( '.paging button' ).removeClass( 'current' ).eq( index ).addClass( 'current' );
					}

					if ( $slider.find('.progress').length ) {
						$slider.find( '.bar' ).css( 'left', ( ( 100 / itemLength ) * options.index ) + '%' );
					}
				}

				function touchStart() {
					if ( event.type === 'touchstart' ) {
						touchstartX = event.touches[0].clientX;
						touchstartY = event.touches[0].clientY;
					} else {
						touchstartX = event.clientX;
						touchstartY = event.clientY;
					}
				}

				function touchMove() {
					if ( event.type === 'touchmove' ) {
						touchmoveX = event.touches[0].clientX - touchstartX;
						touchmoveY = event.touches[0].clientY - touchstartY;
					} else {
						touchmoveX = event.clientX - touchstartX;
						touchmoveY = event.clientY - touchstartY;
					}

					if ( Math.abs( touchmoveX ) > Math.abs( touchmoveY ) ) {
						event.preventDefault();

						if ( touchmoveX > 0 ) {
							if ( options.infinite && options.index < 2 ) {
								options.index = itemLength-1;
							}
						} else {
							if ( options.infinite && options.index >= itemLength-2 ) {
								options.index = 0;
							}
						}

						var translateX = $sliderList.parent().width() * options.index;

						if ( options.multiple ) {
							translateX = ( $slideItem.width() + gutter ) * options.index;

							if ( parseInt( translateX ) > listWidth - $sliderList.parent().width() ) {
								translateX = listWidth - $sliderList.parent().width() - gutter;
							}

							translateX = $sliderList.width() < $sliderList.parent().width() ? 0 : translateX;
						}

						if ( ! options.fade ) {
							$sliderList.css( {
								'transition-duration': '0ms',
								'transform': 'translateX(' + ( touchmoveX - translateX ) + 'px)',
							} );
						}
					}
				}

				function touchEnd() {
					if ( typeof touchstartX === "undefined" ) return false;
					if ( event.type === 'touchend' ) {
						var touch = event.changedTouches[event.changedTouches.length - 1];
						touchendX = touch.clientX;
						touchendY = touch.clientY;
					} else {
						touchendX = event.clientX;
						touchendY = event.clientY;
					}
					touchoffsetX = touchendX - touchstartX;
					touchoffsetY = touchendY - touchstartY;

					if ( Math.abs( touchoffsetX ) > 100 && Math.abs( touchoffsetY ) <= 100 && event.type !== 'mouseout' ){
						if ( touchoffsetX > 0 ){
							prevAction();
						} else {
							nextAction();
						}
					} else if ( touchoffsetX != 0 ) {
						var translateX = - ( ( 100 / itemLength ) * options.index ) + '%';

						if ( options.multiple ) {
							var translateX = - ( ( $slideItem.width() + gutter ) * options.index ) + 'px';

							if ( Math.abs( parseInt( translateX ) ) > listWidth - $sliderList.parent().width() ) {
								translateX = - ( listWidth - $sliderList.parent().width() - gutter ) + 'px';
							}

							translateX = $sliderList.width() < $sliderList.parent().width() ? 0 : translateX;
						}

						if ( ! options.fade ) {
							$sliderList.css( {
								'transition-duration': options.speed + 'ms',
								'transform': 'translateX(' + translateX + ' )',
							} );
						}
					}
				}

				if ( options.controls ){
					if ( ! $slider.find('.prev, .next').length ) {
						$slider.append( '<button type="button" class="prev">이전</button><button type="button" class="next">다음</button>' );

						$slider.on( 'click', '.prev', function() {
							prevAction();
						} );

						$slider.on( 'click', '.next', function() {
							nextAction();
						} );

						controlsDisable( options.index );
					}
				}

				if ( options.paging ){
					if ( ! $slider.find('.paging').length ) {
						var pagingLength = options.infinite ? itemLength - 2 : itemLength;

						$slider.append( '<div class="paging"></div>' );

						for( var i = 0; i < pagingLength; i++ ) {
							$slider.find( '.paging' ).append( '<button type="button">' + (i+1) + '</button>' );
						}

						pagingCurrent( options.index );

						$slider.on( 'click', '.paging button', function() {
							pagingAction( $( this ).index() );
						} );
					}
				}

				if ( options.autoplay ) {
					setInterval( function() {
						var screen = $slider.position().top + $slider.height();
						if ( screen < $( window ).scrollTop() ) return;
						nextAction();
					}, options.autoplaySpeed );
				}

				if ( options.draggable ) {
					$sliderList.on( 'mousedown', function() {
						event.preventDefault();
						if ( event.which != 1 ) return false;
						touchStart();
						$( this ).on( 'mousemove', function() {
							touchMove();
							$( this ).on( 'click', 'a', function(){
								return false;
							} );
						});
					});

					$sliderList.on( 'mouseup mouseleave', function() {
						$( this ).off( 'mousemove' );
						touchEnd();
						if ( event.type === 'mouseup' ) {
							if ( touchoffsetX === 0 ) {
								$( this ).one( 'click', 'a', function(){
									location.href = this.href;
								} );
							}
						}
					});
				}

				if ( options.progress ) {
					if ( ! $slider.find('.progress').length ) {
						$slider.append( '<div class="progress"><span class="bar"></span></div>' );
						$slider.find( '.bar' ).width( 100 / itemLength + '%' );
					}
				}

				$sliderList.off( 'touchstart' ).on( 'touchstart', touchStart );
				$sliderList.off( 'touchmove' ).on( 'touchmove', touchMove );
				$sliderList.off( 'touchend' ).on( 'touchend', touchEnd );

				sliderSet();
				adaptiveHeight();
				slideCurrent( options.index );

				$( window ).on( 'resize.'+nameSpace, function() {
					sliderSet();
					adaptiveHeight();
				} );
			}
		} );
	};

	function common(){
		var $menuBtn = $( '.menu-btn' ),
			$gnb = $( '#gnb' ),
			$searchBtn = $( '.search-btn' ),
			$searchForm = $( '.search-form' ),
			$newsletterBtn = $( '.social-channel ul .newsletter a' );
			$newsletterForm = $( '.newsletter-form' );


		$menuBtn.on( 'click', function() {
			if ( ! $( this ).hasClass( 'on' ) ) {
				$( this ).addClass( 'on' );
				$gnb.addClass( 'on' );
				$( 'body' ).addClass( 'overflow' );
			} else {
				$( this ).removeClass( 'on' );
				$gnb.removeClass( 'on' );
				$( 'body' ).removeClass( 'overflow' );
			}
		} );

		$searchBtn.on( 'click', function() {
			if ( ! $searchForm.is( ':visible' ) ) {
				$searchForm.addClass( 'on' ).find( 'input' ).focus();
				$searchBtn.addClass( 'on' );
				$( 'body' ).addClass( 'overflow' );
				a11yLayer( $searchForm );
			} else {
				$searchForm.removeClass( 'on' );
				$searchBtn.removeClass( 'on' );
				$( 'body' ).removeClass( 'overflow' );
			}
			return false;
		} );

		$searchForm.on( 'click', '.close', function() {
			$searchForm.removeClass( 'on' );
			$searchBtn.removeClass( 'on' ).focus();
			$( 'body' ).removeClass( 'overflow' );
		} );

		$( document ).on( 'click', '.return', function() {
			window.history.back();
		} );

		$newsletterBtn.on( 'click', function() {
			if ( ! $newsletterForm.hasClass( 'on' ) ) {
				if ( $newsletterForm.css( 'position' ) === 'fixed' ) {
					$( 'body' ).addClass( 'overflow' );
				}
				$newsletterForm.addClass( 'on' );
				$( 'html, body' ).animate( { scrollTop: $newsletterForm.offset().top }, 500 );
				a11yLayer( $newsletterForm );
			} else {
				$newsletterForm.removeClass( 'on' );
				$( 'body' ).removeClass( 'overflow' );
			}
			return false;
		} );

		$newsletterForm.on( 'click', '.close', function(){
			$newsletterForm.removeClass( 'on' );
			$( 'body' ).removeClass( 'overflow' );
		} );

		$( document ).on( 'keypress', 'label', function( e ) {
			if ( e.keyCode == '32' ) {
				if ( $( '#' + $( this ).attr( 'for' ) ).prop( 'checked' ) ) {
					$( '#' + $( this ).attr( 'for' ) ).prop( 'checked', false );
				} else {
					$( '#' + $( this ).attr( 'for' ) ).prop( 'checked', true );
				}
			}
		} );

		$( document ).on( 'click', '.page-top', function() {
			$( 'html, body' ).animate( { scrollTop: 0 }, 500 );
			return false;
		} );

		$( document ).on( 'click', '.top-banner .close', function() {
			if ( $( '#cookie' ).prop( 'checked' ) ) {
				var timestamp = Math.floor( +new Date() / 1000 );
				setCookie( 'top-banner', timestamp, 1 );
			}

			$( '.top-banner' ).slideUp( 500, function() {
				$( this ).remove();
				$( 'body' ).removeClass( 'is-banner' );
			} );
		} );

		if ( $( 'body' ).hasClass( 'is-banner' ) ) {
			if ( ! getCookie( 'top-banner' ) ){
				$( '.top-banner' ).show();
			}
		}
	}

	function getCookie( name ){
		var value = null;
		if ( document.cookie ){
			var cookieArray = document.cookie.split( ( escape( name ) + '=' ) );
			if ( cookieArray.length >= 2 ) {
				var arraySub = cookieArray[1].split( ';' );
				value = unescape( arraySub[0] );
			}
		}
		return value;
	}

	function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toUTCString() + ';'
	}

	function a11yLayer( $layer ) {
		var $focusables = $layer.find( 'a, input, label, button' ),
			$focusablesLast = $focusables.eq( $focusables.length-1 );

		$layer.attr( 'tabindex', '-1' );
		$focusablesLast.on( 'keydown', function( e ) {
			if ( ! e.shiftKey && e.keyCode === 9 ) {
				$layer.focus();
			}
		} );
	}

	function mainSlide() {
		$( '.main-slide' ).slider( {
			controls: false,
			autoplay: true,
			fade: true,
			speed: 2000,
		} );

		document.documentElement.style.setProperty( '--vh', ( $( window ).height()-61 ) + 'px' );

		$( window ).on( 'resize', function() {
			document.documentElement.style.setProperty( '--vh', ( $( window ).height()-61 ) + 'px' );
		} );
	}

	function fixedPosts() {
		var $fixedList =  $( '.fixed-posts .post-list' );
		slideOnOff();

		$( window ).resize( function() {
			slideOnOff();
		} );

		function slideOnOff() {
			if ( $fixedList.find( 'ul' ).css( 'display') === 'block' ) {
				$fixedList.slider( {
					controls: false,
					paging: false,
				} );
			} else {
				$fixedList.slider( 'destroy' );
			}
		}
	}

	function artistList() {
		var $artistList = $( '.artist-list' );

		$artistList.on( 'mouseenter', 'ul li a', function() {
			var imageURL = $(this).attr( 'data-image' ),
				artistName = $(this).text();

			if ( imageURL ) {
				$artistList.find( 'figure' ).remove();
				$artistList.prepend( '<figure><img src="' + imageURL + '" alt="' + artistName + ' 대표작품"></figure>' );
				if ( $( window ).scrollTop() + $( '#header' ).height() > $artistList.offset().top ) {
					var posTop = $( window ).scrollTop() + $( '#header' ).height() - $artistList.offset().top;
					$artistList.find( 'figure' ).css( {
						'top': posTop,
						'bottom': 'auto',
					} );
				}

				$artistList.find( 'img' ).load( function() {
					var orientation =  this.naturalWidth <= this.naturalHeight ? 'portrait' : 'landscape',
						listHeight = $artistList.height() - this.naturalHeight;
						if ( posTop > listHeight ) {
							$artistList.find( 'figure' ).css( {
								'top': 'auto',
								'bottom': '0',
							} );
						}
					$artistList.find( 'figure' ).attr( 'class', orientation );
				} );
			}
		} );

		$artistList.on( 'mouseleave', 'ul li a', function() {
			$artistList.find( 'figure' ).remove();
		} );
	}

	function pageCover(){
		function coverScroll() {
			$( '#wrap' ).on( 'scroll touchmove mousewheel', function( e ) {
				var nextPos = parseInt(  $( '.page-cover' ).next().position().top );
			
				if ( e.originalEvent.wheelDelta <= 0 && $( window ).scrollTop() < nextPos ) {
					e.preventDefault();
					$( 'html, body' ).stop().animate( { scrollTop: nextPos }, 500, 'linear', function() {
						$( '#wrap' ).off( 'scroll touchmove mousewheel' );
					} );
					return false;
				}
			} );
		}

		coverScroll();

		$( window ).on( 'scroll', function() {
			var events = $._data( $( '#wrap' )[0], "events");
			if ( 0 === $( window ).scrollTop() && ! events ) {
				coverScroll();
			}
			$( '.page-cover .image' ).css( 'opacity', 1 - ( $( window ).scrollTop() / $( window ).height() ) );
		} );
	}

	function pageNav(){
		var $pageNavTaxonomy = $( '.page-nav.taxonomy' ),
			$pageNavSticky = $( '.page-nav.sticky' ),
			scrollPos = $( window ).scrollTop(),
			scroll = true;

		if ( $pageNavTaxonomy.length && ! $pageNavTaxonomy.find( 'button' ).length ) {
			$pageNavTaxonomy.find( '.inner' ).prepend( '<button type="button">' + $pageNavTaxonomy.find( 'li.current' ).text() + '</button>' );
		}

		$pageNavTaxonomy.find( '.inner button' ).text( $pageNavTaxonomy.find( 'li.current' ).text() );

		$pageNavTaxonomy.on( 'click', 'button', function(){
			if ( ! $(this).hasClass( 'on' ) ) {
				$(this).addClass( 'on' );
			} else {
				$(this).removeClass( 'on' );
			}
		} );

		$pageNavTaxonomy.on( 'click', 'ul li a', function(){
			$pageNavTaxonomy.find( 'button' ).removeClass( 'on' );

		} );

		$( '.page-nav.sticky, .page-nav.search' ).find( '.inner' ).on( 'scroll', function(){
			if ( $(this).scrollLeft() > 0 ) {
				$(this).parent().addClass( 'scroll' );
			} else {
				$(this).parent().removeClass( 'scroll' );
			}
		} );

		if ( $pageNavSticky.length ) {
			$( window ).on( 'scroll', function(){
				if ( scroll && scrollPos < $(this).scrollTop() && $( '#header' ).height() < $(this).scrollTop() ) {
					$( 'body' ).removeClass( 'scroll-up' ).addClass( 'scroll-down' );
				} else if ( scroll && scrollPos > $(this).scrollTop() ) {
					$( 'body' ).removeClass( 'scroll-down' ).addClass( 'scroll-up' );
				}

				scrollPos = $(this).scrollTop();

				if ( $(this).scrollTop() > $pageNavSticky.position().top ) {
					$( 'body' ).addClass( 'sticky-nav' );
				}

				if ( $(this).scrollTop() + $pageNavSticky.outerHeight() < $pageNavSticky.next().position().top ) {
					$( 'body' ).removeClass( 'sticky-nav' );
				}

				$( '.section' ).each( function(i) {
					if ( $( window ).scrollTop() >= parseInt( $(this).position().top - ( $( window ).height() / 2 ) ) ){
						$pageNavSticky.find( 'ul li' ).removeClass( 'current' ).eq(i).addClass( 'current' );
					}
				} );

			} );

			$pageNavSticky.on( 'click', 'ul li a', function() {
				var $thisEl = $( $(this).attr( 'href' ) );
				scroll = false;

				$( 'body' ).removeClass( 'scroll-up' ).addClass( 'scroll-down' );
				$( 'html, body' ).stop().animate( { scrollTop: $thisEl.position().top }, 500, function() {
					scrollPos = $(this).scrollTop();
					scroll = true;
				} );
				return false;
			} );
		}
	}

	function filter() {
		var $filter = $( '.filter' ),
			$select = $filter.find( 'select' );


		if ( $select.find( 'option:selected' ).val() != '' && ! $filter.find( '.clear' ).length ) {
			$filter.find( 'form' ).prepend( '<button type="button" class="clear">clear</button>' );
		}

		$select.each( function() {
			var title = $( this ).find( 'option:selected' ).val() ? $( this ).find( 'option:selected' ).text() : $( this ).find( 'option:first' ).text(),
				trigger_class = ! $( this ).find( 'option:selected' ).val() ? 'trigger' : 'trigger selected';
						
		
			if ( ! $(this).parent().hasClass( 'select-wrap' ) ) {
				if ( $(this).attr( 'disabled' ) == 'disabled' ){
					$(this).wrapAll( '<span class="select-wrap disabled"></span>' );
				} else {
					$(this).wrapAll( '<span class="select-wrap"></span>' );
				}
				$(this).after( '<span class="'+trigger_class+'">' + title + '</span>' );
			}	

			$(this).change(function(){
				var val = $( 'option:selected', this) .text();
				$(this).next().text(val);
				if( $( 'option:selected', this ).val() == '0' || $( 'option:selected', this ).val() == '' ){
					$(this).parent().find( '.trigger' ).removeClass( 'selected' );
					$filter.find( '.clear' ).remove();
				} else {
					$(this).parent().find( '.trigger' ).addClass( 'selected' );
					if ( ! $filter.find( '.clear' ).length ) {
						$filter.find( 'form' ).prepend( '<button type="button" class="clear">Clear Filters</button>' );
					}
				}
				$(this).closest( 'form' ).submit();
			});
		} );
		
		$( document ).on( 'click', '.filter .clear', function() {
			$(this).remove();
			$select.each( function() {
				$(this).find( 'option:first' ).prop( 'selected', true );
				$filter.find( 'form' ).submit();
			} );
		} );

		$filter.off().on( 'click', '.trigger', function() {
			var listType = $(this).siblings( 'select' ).attr( 'name' ),
				listColumn = listType === 'year' ? ' column-' + $(this).siblings( 'select' ).find( 'optgroup' ).length : '',
				listClass = listType+listColumn

			if ( ! $(this).hasClass( 'on' ) ) {
				$filter.find( '.trigger' ).removeClass( 'on' );
				$(this).addClass( 'on' );

				$html = '<div class="option-list ' + listClass + '">';
				if ( $(this).siblings( 'select' ).find( 'optgroup' ).length ) {
					$(this).siblings( 'select' ).find( 'optgroup' ).each( function() {
						$html += '<div class="optgroup">';
						$html += '<strong>' + $(this).attr( 'label' ) + '</strong>';
						$html += '<ul>';

						$(this).find( 'option' ).each( function() {
							$html += '<li><button type="button" value="' + $(this).val() + '">' + $(this).text() + '</button></li>';
						} );

						$html += '</ul>';
						$html += '</div>';
					} );
				} else {
					$(this).siblings( 'select' ).find( 'option' ).each( function() {
						$html += ' \
							<ul> \
								<li><button type="button" value="' + $(this).val() + '">' + $(this).text() + '</button></li> \
							</ul> \
						';
					} );
				}
				$html += '</div>';
				$filter.find( '.option-list' ).remove();
				$filter.append( $html );
			} else {
				$(this).removeClass( 'on' );
				$filter.find( '.option-list' ).remove();
			}
		} );

		$( document ).on( 'click', '.filter .option-list button', function() {
			var value = $(this).attr( 'value' );

			$filter.find( 'option[value="' + value + '"]' ).prop( 'selected', true );
			$filter.find( 'form' ).submit();
		} );
	}

	function layerPopup() {
		var $layerPopup = $( '.layer-popup' ),
			$toggleBtn = $( '.toggle-layer' );

		$layerPopup.on( 'click', '.close', function() {
			var ID = $( this ).parent().attr( 'id' );

			$( this ).parent().removeClass( 'on' );
			$( '#dimmed' ).remove();
		} );

		$toggleBtn.on( 'click', function() {
			var $layer = $( $( this ).attr( 'href' ) ),
				triggerPos = $( this ).position();

			if( ! $( '#dimmed' ).length ) {
				$( 'body' ).append( '<div id="dimmed" class="transparent"></div>' );
			}
			$layer.addClass( 'on' ).focus();
			a11yLayer( $layer );
			popupPosition( $layer );
			$( window ).on( 'resize', popupPosition );
			return false;
		} );

		$( document ).on( 'click', '#dimmed', function(){
			$( this ).remove();
			$( '.layer-popup' ).removeClass( 'on' );
		} );

		function popupPosition( $layer ) {
			var triggerPos = $toggleBtn.position();

			if ( $( window ).width() > 1023 ){
				$layerPopup.css({
					"position": "absolute",
					"top": triggerPos.top,
					"left": triggerPos.left + $toggleBtn.width() + 10,
					"margin": 0,
					"transform": "translateY(0)",
				});
			} else {
				$layerPopup.removeAttr( 'style' );
			}
		}
	}

	function galleryView() {
		var $galleryView = $( '.gallery-view' );

		$( '.gallery-slider' ).slider( {
			paging: false,
		} );

		$galleryView.on( 'click', '.inquire-view', function() {
			$galleryView.addClass( 'inquire' );
			$( '.gallery-slider' ).slider();
			$( 'html, body' ).animate( { scrollTop: $( '.aside' ).position().top }, 500 );
		} );

		$galleryView.on( 'click', '.cancel', function() {
			$galleryView.removeClass( 'inquire' );
			$( '.gallery-slider' ).slider();
		} );
	}

	function fieldCheck() {
		var $field = $( '.row input, .row textarea' );

		$field.on( 'blur', function() {
			if ( $( this ).val() ) {
				$( this ).addClass( 'valid' );
			} else {
				$( this ).removeClass( 'valid' );
			}
		} );
	}

	function readMore() {
		var $entryContent = $( '.detail .entry-content' ),
			$paragraph = $entryContent.find( 'p' ),
			lineHeight = parseInt( $paragraph.css( 'line-height' ) );

		if ( $entryContent.find( '.inner' ).height() > lineHeight * 30 ) {
			$entryContent.addClass( 'ellipsis' );
			$entryContent.find( '.inner' ).after( '<button type="button" class="read-more">Read More</button>' );
		}

		$entryContent.on( 'click', '.read-more', function() {
			if ( $( this ).text() === 'Less' ) {
				$( this ).text( 'Read more' );
				$entryContent.addClass( 'ellipsis' );
			} else {
				var currentPos = $( window ).scrollTop();
				$( 'html, body' ).animate( { scrollTop: currentPos }, 1 );

				$( this ).text( 'Less' );
				$entryContent.removeClass( 'ellipsis' );
			}
		} );
	}

	// Document ready
	common();
	if ( $( '.main-slide' ).length ) mainSlide();
	if ( $( '.fixed-posts' ).length ) fixedPosts();
	if ( $( '.row input, .row textarea' ).length ) fieldCheck();

	function execute() {
		if ( $( '.artist-list' ).length ) artistList();
		if ( $( '.page-cover' ).length ) pageCover();
		if ( $( '.page-nav' ).length ) pageNav();
		if ( $( '.filter' ).length ) filter();
		if ( $( '.layer-popup, .toggle-layer' ).length ) layerPopup();
		if ( $( '.gallery-view' ).length ) galleryView();
		if ( $( '.row input, .row textarea' ).length ) fieldCheck();
		if ( $( '.detail .entry-content' ).length ) readMore();
	}

	return {
		artistList: artistList,
		pageCover: pageCover,
		pageNav: pageNav,
		filter: filter,
		layerPopup: layerPopup,
		galleryView: galleryView,
		fieldCheck: fieldCheck,
		execute: execute,
	};
} )( jQuery );
