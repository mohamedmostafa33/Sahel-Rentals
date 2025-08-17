import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onFilterPressed;
  final VoidCallback? onSortPressed;
  final TextEditingController? controller;
  final bool showFilters;
  final bool showSort;
  final int? filterCount;
  final String? sortLabel;

  const CustomSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onFilterPressed,
    this.onSortPressed,
    this.controller,
    this.showFilters = false,
    this.showSort = false,
    this.filterCount,
    this.sortLabel,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Main search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Search field
                Expanded(
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _hasFocus = hasFocus;
                      });
                    },
                    child: TextField(
                      controller: _controller,
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1E293B),
                      ),
                      decoration: InputDecoration(
                        hintText: widget.hintText ?? 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color:
                              _hasFocus
                                  ? const Color(0xFF2196F3)
                                  : Colors.grey[500],
                          size: 24,
                        ),
                        suffixIcon:
                            _controller.text.isNotEmpty
                                ? GestureDetector(
                                  onTap: () {
                                    _controller.clear();
                                    widget.onChanged?.call('');
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey[500],
                                    size: 20,
                                  ),
                                )
                                : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),

                // Action buttons
                Row(
                  children: [
                    // Filter button
                    if (widget.showFilters) ...[
                      const SizedBox(width: 8),
                      _buildActionButton(
                        icon: Icons.filter_list,
                        onPressed: widget.onFilterPressed,
                        hasIndicator:
                            widget.filterCount != null &&
                            widget.filterCount! > 0,
                        indicatorText: widget.filterCount?.toString(),
                      ),
                    ],

                    // Sort button
                    if (widget.showSort) ...[
                      const SizedBox(width: 8),
                      _buildActionButton(
                        icon: Icons.sort,
                        onPressed: widget.onSortPressed,
                        hasIndicator: widget.sortLabel != null,
                        indicatorText: widget.sortLabel,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback? onPressed,
    bool hasIndicator = false,
    String? indicatorText,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color:
                hasIndicator
                    ? const Color(0xFF2196F3).withOpacity(0.1)
                    : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  icon,
                  color:
                      hasIndicator ? const Color(0xFF2196F3) : Colors.grey[600],
                  size: 20,
                ),
              ),
            ),
          ),
        ),

        // Indicator badge
        if (hasIndicator && indicatorText != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                indicatorText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

// Advanced search bar with suggestions
class CustomAdvancedSearchBar extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final List<String> suggestions;
  final Function(String)? onSuggestionSelected;
  final Widget? leading;
  final Widget? trailing;

  const CustomAdvancedSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.suggestions = const [],
    this.onSuggestionSelected,
    this.leading,
    this.trailing,
  });

  @override
  State<CustomAdvancedSearchBar> createState() =>
      _CustomAdvancedSearchBarState();
}

class _CustomAdvancedSearchBarState extends State<CustomAdvancedSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showSuggestions = false;
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _showSuggestions = _focusNode.hasFocus && _filteredSuggestions.isNotEmpty;
    });
  }

  void _filterSuggestions(String query) {
    if (query.isEmpty) {
      _filteredSuggestions = [];
    } else {
      _filteredSuggestions =
          widget.suggestions
              .where(
                (suggestion) =>
                    suggestion.toLowerCase().contains(query.toLowerCase()),
              )
              .take(5)
              .toList();
    }

    setState(() {
      _showSuggestions = _focusNode.hasFocus && _filteredSuggestions.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (value) {
              widget.onChanged?.call(value);
              _filterSuggestions(value);
            },
            onSubmitted: widget.onSubmitted,
            style: const TextStyle(fontSize: 16, color: Color(0xFF1E293B)),
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Search...',
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
              prefixIcon:
                  widget.leading ??
                  const Icon(Icons.search, color: Color(0xFF2196F3), size: 24),
              suffixIcon: widget.trailing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),

        // Suggestions
        if (_showSuggestions)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredSuggestions.length,
              separatorBuilder:
                  (context, index) =>
                      Divider(height: 1, color: Colors.grey[200]),
              itemBuilder: (context, index) {
                final suggestion = _filteredSuggestions[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _controller.text = suggestion;
                      widget.onSuggestionSelected?.call(suggestion);
                      _focusNode.unfocus();
                      setState(() {
                        _showSuggestions = false;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            color: Colors.grey[500],
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              suggestion,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.north_west,
                            color: Colors.grey[400],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
