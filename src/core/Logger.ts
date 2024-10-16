/**
 * Author: CUESOR
 * Date: 2024-07-25
 */

// 定义日志等级
export enum LogLevel {
    DEBUG = 0,
    INFO = 1,
    WARN = 2,
    ERROR = 3,
    NONE = 4
}

// 当前日志等级
export let currentLogLevel: LogLevel = LogLevel.INFO;

export let logState: boolean = true;

const noop = () => {};

const createLogger = (level: LogLevel, method: 'log' | 'warn' | 'error'): (content: any, ...subst: any[]) => void => {
    const consoleMethod = console[method];
    return (content: any, ...subst: any[]) => {
        if (logState && level >= currentLogLevel) {
            consoleMethod(content, ...subst);
        }
    };
};

export const debug = createLogger(LogLevel.DEBUG, 'log');
export const log = createLogger(LogLevel.INFO, 'log');
export const warn = createLogger(LogLevel.WARN, 'warn');
export const error = createLogger(LogLevel.ERROR, 'error');

export function logTime(name: string, finish?: boolean): void {
    if (logState && LogLevel.DEBUG >= currentLogLevel) {
        console[finish ? 'timeEnd' : 'time'](name);
    }
}

// 设置日志等级
export function setLogLevel(level: LogLevel): void {
    currentLogLevel = level;
}

// 设置日志状态
export function setLogState(state: boolean): void {
    logState = state;
}
