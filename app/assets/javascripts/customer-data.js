// TODO first run on first page load
// TODO not table layout fixed if more than 6 tags selected
document.addEventListener("turbolinks:load", function() {
	if (!document.getElementById('customer-data-table')) return;
	function filter_by_tag(tag, table, scroller) {
		tag.classList.toggle('is-primary');
		tag.classList.toggle('is-lighter');
		var col = table.querySelector('col.' + tag.dataset.target);
		col.classList.toggle('is-inactive');
		if (BROWSER_IS_WEBKIT) {
			var td = table.querySelector('td.' + tag.dataset.target);
			td.classList.toggle('is-inactive');
		}
		scroller.children[0].style.width = table.scrollWidth + 'px';
	}

	var outerContainer = document.getElementById('customer-data-table');
	var container = outerContainer.querySelector('.table-container');
	var table = outerContainer.querySelector('.table');
	var selector = outerContainer.querySelector('.selectors');
	var scroller = outerContainer.querySelector('.scroller');
	var clickedSelectors = 4;

	function SyncScrollerScroll() {
		var scrolled = scroller.scrollLeft / scroller.scrollWidth;
		container.scrollLeft = scrolled * container.scrollWidth;
	}

	function SyncContainerScroll(){
		var scrolled = container.scrollLeft / container.scrollWidth;
		scroller.scrollLeft = scrolled * scroller.scrollWidth;
	}

	scroller.children[0].style.width = table.scrollWidth + 'px';
	container.addEventListener('scroll', SyncContainerScroll);
	scroller.addEventListener('mouseenter', function () {
		scroller.addEventListener('scroll', SyncScrollerScroll);
		container.removeEventListener('scroll', SyncContainerScroll);
	});
	scroller.addEventListener('mouseleave', function () {
		scroller.removeEventListener('scroll', SyncScrollerScroll);
		container.addEventListener('scroll', SyncContainerScroll);
	});

	selector.querySelectorAll('.tag').forEach(function (tag) {
		tag.addEventListener('click', function () {
			filter_by_tag(tag, table, scroller);
			if (BROWSER_IS_WEBKIT) filter_by_tag(tag, table, scroller);
			clickedSelectors += -1 + 2 * tag.classList.contains('is-primary');
			if (clickedSelectors > 6) {
				table.classList.remove('fixed');
			}else{
				table.classList.add('fixed');
			}
		});
	});
});
