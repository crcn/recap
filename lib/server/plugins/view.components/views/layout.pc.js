module.exports = function(fragment, block, element, text, modifiers) {
    return fragment([ element("html", {}, [ text(" "), element("head", {}, [ text(" ") ]), text(" "), element("body", {}, [ text(" "), block({
        section: {
            fn: function() {
                return this.ref("sections.body").value();
            },
            refs: [ "sections.body" ]
        }
    }), text(" ") ]), text(" ") ]) ]);
};