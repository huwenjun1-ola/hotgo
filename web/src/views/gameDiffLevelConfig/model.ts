import { h, ref } from 'vue';
import { NAvatar, NImage, NTag, NSwitch, NRate, FormItemRule } from 'naive-ui';
import { cloneDeep } from 'lodash-es';
import { FormSchema } from '@/components/Form';
import { Dicts } from '@/api/dict/dict';

import { isArray, isNullObject } from '@/utils/is';
import { getFileExt } from '@/utils/urlUtils';
import { defRangeShortcuts, defShortcuts, formatToDate } from '@/utils/dateUtil';
import { validate } from '@/utils/validateUtil';
import { getOptionLabel, getOptionTag, Options, errorImg } from '@/utils/hotgo';
import { Switch } from '@/api/addons/hgexample/table';

export interface State {
  levelId: number;
  imgA: string;
  imgB: string;
  type: string;
  answerRects: string;
  dir: number;
  desc: string;
}

export const defaultState: State = {
  levelId: 0,
  imgA: '',
  imgB: '',
  type: '',
  answerRects: '',
  dir: 0,
  desc: '',
};

export function newState(state: State | null): State {
  if (state !== null) {
    return cloneDeep(state);
  }
  return cloneDeep(defaultState);
}

export const rules = {
  imgA: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    message: '请输入图片A的地址',
  },
  imgB: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    message: '请输入图片B的地址',
  },
  type: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    message: '请输入图片主题类型',
  },
  answerRects: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    validator: answer_validate,
  },
  dir: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'number',
  },
};

export const schemas = ref<FormSchema[]>([
  {
    field: 'levelId',
    component: 'NInputNumber',
    label: '关卡id',
    componentProps: {
      placeholder: '请输入关卡id',
      onUpdateValue: (e: any) => {
        console.log(e);
      },
    },
  },
  {
    field: 'type',
    component: 'NInput',
    label: '图片主题',

    componentProps: {
      placeholder: '请输入图片主题',
      onUpdateValue: (e: any) => {
        console.log(e);
      },
    },
  },
]);

export const columns = [
  {
    title: '关卡id',
    key: 'levelId',
  },
  {
    title: '图片主题',
    key: 'type',
  },
  {
    title: '原图',
    key: 'imgA',
    render(row) {
      return h(NImage, {
        width: 32,
        height: 32,
        src: row.imgA,
        // fallbackSrc: errorImg,
        style: {
          width: '32px',
          height: '32px',
          'max-width': '100%',
          'max-height': '100%',
        },
      });
    },
  },
  {
    title: '对比图',
    key: 'imgB',
    render(row) {
      return h(NImage, {
        width: 32,
        height: 32,
        src: row.imgB,
        // fallbackSrc: errorImg,
        style: {
          width: '32px',
          height: '32px',
          'max-width': '100%',
          'max-height': '100%',
        },
      });
    },
  },

  {
    title: '答案矩形坐标点',
    key: 'answerRects',
  },
  {
    title: '布局',
    key: 'dir',
    render(row) {
      return h(
        NSwitch,
        {
          value: row.dir === 0,
        },
        {
          checked: '水平',
          unchecked: '垂直',
        }
      );
    },
  },
  {
    title: '描述',
    key: 'desc',
  },
];
interface Pos {
  x: number;
  y: number;
}
interface AnswerRect {
  leftTop: Pos;
  rightTop: Pos;
  rightBottom: Pos;
  leftBottom: Pos;
}
function hasField(obj :Object, field:  string): boolean {
  return field in obj;
}
const fields = ['leftTop', 'rightTop', 'rightBottom', 'leftBottom'];
// 答案数据验证
function answer_validate(_rule: FormItemRule, value: any, callback: Function) {
  try {
    const answerObj = JSON.parse(value);
    // console.log(rule, value, callback, answer);
    const ok = fields.every((field) => {
      return hasField(answerObj[field], 'x') && hasField(answerObj[field], 'y');
    });
    if (ok) {
      callback();
      return;
    }

    callback(new Error('坐标点数据格式错误'));
  } catch (e) {
    callback(new Error('坐标点数据格式错误'));
  }
}
