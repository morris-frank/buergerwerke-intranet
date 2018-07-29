'use strict';

document.addEventListener('DOMContentLoaded', function () {
	var filters = document.getAll('.table-filter');
	var tables = document.getAll('table.is-filterable');

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

});
