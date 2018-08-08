domready(function () {
	var tables = document.getAll('table.is-filterable');
	var filters = document.getAll('.table-filter');

	if (filters.length > 0) setFilterListeners();

	function setFilterListeners () {
		filters.forEach(function (filter) {
			filter.addEventListener('input', function () {
				var searchString = filter.value.trim().toLowerCase();
				filter_tables(searchString);
			});
		});
	}

	function filter_tables (searchString) {
		tables.forEach(function (table) {
			filter_table(table, searchString)
		});
	}

	function filter_table (table, searchString) {
		for (var i = 0, row; row = table.rows[i]; i++) {
			var text = row.textContent.trim().toLowerCase();
			row.style.display = text.indexOf(searchString) === -1 ? 'none' : 'table-row';
		}
	}

	var tags = document.getAll('.table-select .tag');

	if (tags.length > 0) setSelectsListeners();

	function setSelectsListeners () {
		tags.forEach(function (tag) {
			tag.addEventListener('click', function () {
				tag.classList.toggle('is-primary');
				filter_by_tag(tag);
			});
			if (BROWSER_IS_WEBKIT) filter_by_tag(tag);
		});
	}

	function filter_by_tag (tag) {
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
});
