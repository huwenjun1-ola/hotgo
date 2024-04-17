import { h, ref } from 'vue';
import { NAvatar, NImage, NTag, NSwitch, NRate } from 'naive-ui';
import { cloneDeep } from 'lodash-es';
import { FormSchema } from '@/components/Form';
import { Dicts } from '@/api/dict/dict';

import { isArray, isNullObject } from '@/utils/is';
import { getFileExt } from '@/utils/urlUtils';
import { defRangeShortcuts, defShortcuts, formatToDate } from '@/utils/dateUtil';
import { validate } from '@/utils/validateUtil';
import { getOptionLabel, getOptionTag, Options, errorImg } from '@/utils/hotgo';
import {Switch} from "@/api/addons/hgexample/table";


export interface State {
  levelId: number;
  imgA: string;
  imgB: string;
  type: string;
  answerRects: string;
  dir: string;
  desc: string;
}

export const defaultState: State = {
  levelId: 0,
  imgA: '',
  imgB: '',
  type: '',
  answerRects: '',
  dir: '',
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
    message: '请输入answer_rects',
  },
  dir: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    message: '请输入0 左右 1 上下',
  },
};

export const schemas = ref<FormSchema[]>([
  {
    field: 'levelId',
    component: 'NInput',
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
      placeholder: '请输入图片主题类型',
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
    title: '图片A',
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
    title: '图片B',
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
    title: '水平',
    key: 'dir',
    render(row) {
      return h(NSwitch, {
        value: row.dir === 0,
        checked: '水平',
        unchecked: '垂直',
      });
    },
  },
  {
    title: '描述',
    key: 'desc',
  },
];
