function setFilterListeners(filters) {
	filters.forEach(function (filter) {
		filter.addEventListener('input', function () {
			var searchString = filter.value.trim().toLowerCase();
			filter_tables(searchString);
		});
	});
}

function filter_tables(searchString) {
	var tables = document.getAll('table.is-filterable');
	tables.forEach(function (table) {
		for (var i = 0, row; row = table.tBodies[0].rows[i]; i++) {
			var text = row.textContent.trim().toLowerCase();
			row.style.display = text.indexOf(searchString) === -1 ? 'none' : 'table-row';
		}
	});
}

function setSelectsListeners(tags) {
	tags.forEach(function (tag) {
		tag.addEventListener('click', function () {
			tag.classList.toggle('is-primary');
			filter_by_tag(tag);
		});
		if (BROWSER_IS_WEBKIT) filter_by_tag(tag);
	});
}

function filter_by_tag(tag) {
	var target = '.' + tag.dataset.target;
	var active = tag.classList.contains('is-primary');
	document.getAll('col' + target).forEach(function (col) {
		col.style.visibility = active ? "" : "collapse";
	});
	if (BROWSER_IS_WEBKIT) {
		document.getAll(target).forEach(function (td) {
			td.style.display = active ? "" : "none";
		});
	}
}

document.addEventListener("turbolinks:load", function() {
// domready(function () {
	var filters = document.getAll('.table-filter');
	if (filters.length > 0) setFilterListeners(filters);


	var tags = document.getAll('.table-select .tag');
	if (tags.length > 0) setSelectsListeners(tags);
});
