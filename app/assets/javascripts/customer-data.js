// TODO first run on first page load
// TODO not table layout fixed if more than 6 tags selected
document.addEventListener("turbolinks:load", function() {
	if (!document.getElementById('customer-data-table')) return;
	function filter_by_tag(tag, table, scroller) {
		tag.classList.toggle('is-primary');
		tag.classList.toggle('is-light');
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

	var scroller = outerContainer.querySelector('.scroller');
	scroller.addEventListener('scroll', function() {
		var scrolled = scroller.scrollLeft / scroller.scrollWidth;
		container.scrollLeft = scrolled * container.scrollWidth;
	});

	var table = outerContainer.querySelector('.table');
	var selector = outerContainer.querySelector('.selectors');
	selector.querySelectorAll('.tag').forEach(function (tag) {
		tag.addEventListener('click', function () {
			filter_by_tag(tag, table, scroller);
		});
		if (BROWSER_IS_WEBKIT) filter_by_tag(tag, table, scroller);
	});
});
