(function(document) {
	'use strict';

	var LightTableFilter = (function(Arr) {

		var _filterarr;

		function _onInputEvent(e) {
			_filter(e.target.value);
		}

		function _onTagEvent(e) {
			var _tag = e.target.textContent.trim();
			var inputs = document.getElementsByClassName('table-filter');
			Arr.forEach.call(inputs, function(input) {
				var words = input.value.trim().split(' ');
				var tag_index = words.indexOf(_tag);
				if (tag_index === -1) {
					words.push(_tag);
				} else {
					words.splice(tag_index, 1);
				}
				input.value = words.join(' ');
				_filter(input.value);
			});

		}

		function _filter(filterstr) {
			_filterarr = filterstr.toLowerCase().trim().split(' ');
			var tables = document.getElementsByClassName('is-filterable');
			Arr.forEach.call(tables, function(table) {
				Arr.forEach.call(table.tBodies, function(tbody) {
					Arr.forEach.call(tbody.rows, _filter_row);
				});
			});
		}

		function _filter_row(row) {
			var text = row.textContent.toLowerCase();
			var nohit = false;
			for (var i = 0; i < _filterarr.length; i++) {
				nohit = nohit || text.indexOf(_filterarr[i]) === -1;
			}

			row.style.display = nohit ? 'none' : 'table-row';
		}

		return {
			init: function() {
				var inputs = document.getElementsByClassName('table-filter');
				Arr.forEach.call(inputs, function(input) {
					input.oninput = _onInputEvent;
				});

				var tags = document.getElementsByClassName('tag');
				Arr.forEach.call(tags, function(tag) {
					tag.onclick = _onTagEvent;
				});
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableFilter.init();
		}
	});
})(document);
