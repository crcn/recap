module.exports = function(fragment, block, element, text, modifiers) {
    return fragment([ block({
        mainLayout: {
            fn: function() {
                return {
                    parent: this.ref("this").value()
                };
            },
            refs: [ "this" ]
        }
    }, function(fragment, block, element, text, modifiers) {
        return fragment([ text(" "), block({
            section: {
                fn: function() {
                    return "body";
                },
                refs: []
            }
        }, function(fragment, block, element, text, modifiers) {
            return fragment([ text(" "), element("a", {
                href: [ "javascript:", {
                    fn: function() {
                        return this.ref("parent").call("getBookmarklet", []).value();
                    },
                    refs: [ "parent.getBookmarklet" ]
                } ]
            }, [ text("inject recorder") ]), text(" ") ]);
        }), text(" ") ]);
    }) ]);
};