/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

/**
 * Replaces text matching a regular expression with a custom node.
 */
<<<<<<< HEAD
export const replaceInTextNode = (regex, createNode) => (node) => {
  const text = node.textContent;
  const textLength = text.length;
=======
const regexParseNode = (params) => {
  const { node, regex, createNode, captureAdjust } = params;
  const text = node.textContent;
  const textLength = text.length;
  let nodes;
  let new_node;
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  let match;
  let lastIndex = 0;
  let fragment;
  let n = 0;
<<<<<<< HEAD
  // eslint-disable-next-line no-cond-assign
  while ((match = regex.exec(text))) {
    n += 1;
=======
  let count = 0;
  // eslint-disable-next-line no-cond-assign
  while ((match = regex.exec(text))) {
    n += 1;
    // Safety check to prevent permanent
    // client crashing
    if (++count > 9999) {
      return {};
    }
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
    // Lazy init fragment
    if (!fragment) {
      fragment = document.createDocumentFragment();
    }
<<<<<<< HEAD
    const matchText = match[0];
    const matchLength = matchText.length;
    const matchIndex = match.index;
    // Insert previous unmatched chunk
    if (lastIndex < matchIndex) {
      fragment.appendChild(
        document.createTextNode(text.substring(lastIndex, matchIndex))
      );
    }
    lastIndex = matchIndex + matchLength;
    // Create a wrapper node
    fragment.appendChild(createNode(matchText));
=======
    // Lazy init nodes
    if (!nodes) {
      nodes = [];
    }
    const matchText = captureAdjust ? captureAdjust(match[0]) : match[0];
    const matchLength = matchText.length;
    // If matchText is set to be a substring nested within the original
    // matched text make sure to properly offset the index
    const matchIndex = match.index + match[0].indexOf(matchText);
    // Insert previous unmatched chunk
    if (lastIndex < matchIndex) {
      new_node = document.createTextNode(text.substring(lastIndex, matchIndex));
      nodes.push(new_node);
      fragment.appendChild(new_node);
    }
    lastIndex = matchIndex + matchLength;
    // Create a wrapper node
    new_node = createNode(matchText);
    nodes.push(new_node);
    fragment.appendChild(new_node);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  }
  if (fragment) {
    // Insert the remaining unmatched chunk
    if (lastIndex < textLength) {
<<<<<<< HEAD
      fragment.appendChild(
        document.createTextNode(text.substring(lastIndex, textLength))
      );
=======
      new_node = document.createTextNode(text.substring(lastIndex, textLength));
      nodes.push(new_node);
      fragment.appendChild(new_node);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
    }
    // Commit the fragment
    node.parentNode.replaceChild(fragment, node);
  }
<<<<<<< HEAD
=======

  return {
    nodes: nodes,
    n: n,
  };
};

/**
 * Replace text of a node with custom nades if they match
 * a regex expression or are in a word list
 */
export const replaceInTextNode = (regex, words, createNode) => (node) => {
  let nodes;
  let result;
  let n = 0;

  if (regex) {
    result = regexParseNode({
      node: node,
      regex: regex,
      createNode: createNode,
    });
    nodes = result.nodes;
    n += result.n;
  }

  if (words) {
    let i = 0;
    let wordRegexStr = '(';
    for (let word of words) {
      // Capture if the word is at the beginning, end, middle,
      // or by itself in a message
      wordRegexStr += `^${word}\\W|\\W${word}\\W|\\W${word}$|^${word}$`;
      // Make sure the last character for the expression is NOT '|'
      if (++i !== words.length) {
        wordRegexStr += '|';
      }
    }
    wordRegexStr += ')';
    const wordRegex = new RegExp(wordRegexStr, 'gi');
    if (regex && nodes) {
      for (let a_node of nodes) {
        result = regexParseNode({
          node: a_node,
          regex: wordRegex,
          createNode: createNode,
          captureAdjust: (str) => str.replace(/^\W|\W$/g, ''),
        });
        n += result.n;
      }
    } else {
      result = regexParseNode({
        node: node,
        regex: wordRegex,
        createNode: createNode,
        captureAdjust: (str) => str.replace(/^\W|\W$/g, ''),
      });
      n += result.n;
    }
  }
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  return n;
};

// Highlight
// --------------------------------------------------------

/**
 * Default highlight node.
 */
const createHighlightNode = (text) => {
  const node = document.createElement('span');
  node.setAttribute('style', 'background-color:#fd4;color:#000');
  node.textContent = text;
  return node;
};

/**
 * Highlights the text in the node based on the provided regular expression.
 *
 * @param {Node} node Node which you want to process
 * @param {RegExp} regex Regular expression to highlight
 * @param {(text: string) => Node} createNode Highlight node creator
 * @returns {number} Number of matches
 */
export const highlightNode = (
  node,
  regex,
<<<<<<< HEAD
=======
  words,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  createNode = createHighlightNode
) => {
  if (!createNode) {
    createNode = createHighlightNode;
  }
  let n = 0;
  const childNodes = node.childNodes;
  for (let i = 0; i < childNodes.length; i++) {
    const node = childNodes[i];
    // Is a text node
    if (node.nodeType === 3) {
<<<<<<< HEAD
      n += replaceInTextNode(regex, createNode)(node);
    } else {
      n += highlightNode(node, regex, createNode);
=======
      n += replaceInTextNode(regex, words, createNode)(node);
    } else {
      n += highlightNode(node, regex, words, createNode);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
    }
  }
  return n;
};

// Linkify
// --------------------------------------------------------

// prettier-ignore
const URL_REGEX = /(?:(?:https?:\/\/)|(?:www\.))(?:[^ ]*?\.[^ ]*?)+[-A-Za-z0-9+&@#/%?=~_|$!:,.;(){}]+/ig;

/**
 * Highlights the text in the node based on the provided regular expression.
 *
 * @param {Node} node Node which you want to process
 * @returns {number} Number of matches
 */
export const linkifyNode = (node) => {
  let n = 0;
  const childNodes = node.childNodes;
  for (let i = 0; i < childNodes.length; i++) {
    const node = childNodes[i];
    const tag = String(node.nodeName).toLowerCase();
    // Is a text node
    if (node.nodeType === 3) {
      n += linkifyTextNode(node);
    } else if (tag !== 'a') {
      n += linkifyNode(node);
    }
  }
  return n;
};

<<<<<<< HEAD
const linkifyTextNode = replaceInTextNode(URL_REGEX, (text) => {
=======
const linkifyTextNode = replaceInTextNode(URL_REGEX, null, (text) => {
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  const node = document.createElement('a');
  node.href = text;
  node.textContent = text;
  return node;
});
