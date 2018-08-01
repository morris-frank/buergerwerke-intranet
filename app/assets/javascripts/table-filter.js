'use strict';

document.addEventListener('DOMContentLoaded', function () {
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
				toggle_tag(tag);
			});
		});
	}

	function toggle_tag (tag) {
		tag.classList.toggle('is-primary');
		var target = '.' + tag.dataset.target;
		var active = tag.classList.contains('is-primary');
		document.getAll(target).forEach(function (col) {
			col.style.visibility=active?"":"collapse";
		});
	}
});
