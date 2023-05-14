/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD
import { canRender, classes } from 'common/react';
import { Component, createRef, InfernoNode, RefObject } from 'inferno';
import { addScrollableNode, removeScrollableNode } from '../events';
import { BoxProps, computeBoxClassName, computeBoxProps } from './Box';
=======
import { BoxProps, computeBoxClassName, computeBoxProps } from './Box';
import { Component, InfernoNode, RefObject, createRef } from 'inferno';
import { addScrollableNode, removeScrollableNode } from '../events';
import { canRender, classes } from 'common/react';
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

type SectionProps = BoxProps & {
  className?: string;
  title?: InfernoNode;
  buttons?: InfernoNode;
  fill?: boolean;
  fitted?: boolean;
  scrollable?: boolean;
  scrollableHorizontal?: boolean;
  /** @deprecated This property no longer works, please remove it. */
<<<<<<< HEAD
  level?: boolean;
  /** @deprecated Please use `scrollable` property */
  overflowY?: any;
=======
  level?: never;
  /** @deprecated Please use `scrollable` property */
  overflowY?: never;
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  /** @member Allows external control of scrolling. */
  scrollableRef?: RefObject<HTMLDivElement>;
  /** @member Callback function for the `scroll` event */
  onScroll?: (this: GlobalEventHandlers, ev: Event) => any;
};

export class Section extends Component<SectionProps> {
  scrollableRef: RefObject<HTMLDivElement>;
  scrollable: boolean;
  onScroll?: (this: GlobalEventHandlers, ev: Event) => any;
  scrollableHorizontal: boolean;

  constructor(props) {
    super(props);
    this.scrollableRef = props.scrollableRef || createRef();
    this.scrollable = props.scrollable;
    this.onScroll = props.onScroll;
    this.scrollableHorizontal = props.scrollableHorizontal;
  }

  componentDidMount() {
    if (this.scrollable || this.scrollableHorizontal) {
<<<<<<< HEAD
      addScrollableNode(this.scrollableRef.current);
=======
      addScrollableNode(this.scrollableRef.current as HTMLElement);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
      if (this.onScroll && this.scrollableRef.current) {
        this.scrollableRef.current.onscroll = this.onScroll;
      }
    }
  }

  componentWillUnmount() {
    if (this.scrollable || this.scrollableHorizontal) {
<<<<<<< HEAD
      removeScrollableNode(this.scrollableRef.current);
=======
      removeScrollableNode(this.scrollableRef.current as HTMLElement);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
    }
  }

  render() {
    const {
      className,
      title,
      buttons,
      fill,
      fitted,
      scrollable,
      scrollableHorizontal,
      children,
      onScroll,
      ...rest
    } = this.props;
    const hasTitle = canRender(title) || canRender(buttons);
    return (
      <div
        className={classes([
          'Section',
          Byond.IS_LTE_IE8 && 'Section--iefix',
          fill && 'Section--fill',
          fitted && 'Section--fitted',
          scrollable && 'Section--scrollable',
          scrollableHorizontal && 'Section--scrollableHorizontal',
          className,
          computeBoxClassName(rest),
        ])}
        {...computeBoxProps(rest)}>
        {hasTitle && (
          <div className="Section__title">
            <span className="Section__titleText">{title}</span>
            <div className="Section__buttons">{buttons}</div>
          </div>
        )}
        <div className="Section__rest">
          <div
            ref={this.scrollableRef}
            onScroll={onScroll}
            className="Section__content">
            {children}
          </div>
        </div>
      </div>
    );
  }
}
