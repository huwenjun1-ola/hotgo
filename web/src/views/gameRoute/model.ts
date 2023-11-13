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


export interface State {
  id: number;
  factoryType: string;
  url: string;
  desc: string;
}

export const defaultState: State = {
  id: 0,
  factoryType: '',
  url: '',
  desc: '',
};

export function newState(state: State | null): State {
  if (state !== null) {
    return cloneDeep(state);
  }
  return cloneDeep(defaultState);
}


export const rules = {
  factoryType: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    message: '请输入房型',
  },
  url: {
    required: true,
    trigger: ['blur', 'input'],
    type: 'string',
    message: '请输入游戏地址',
  },
};

export const schemas = ref<FormSchema[]>([
  {
    field: 'factoryType',
    component: 'NInput',
    label: '房型',
    componentProps: {
      placeholder: '请输入房型',
      onUpdateValue: (e: any) => {
        console.log(e);
      },
    },
  },
]);

export const columns = [
  // {
  //   title: 'id',
  //   key: 'id',
  // },
  {
    title: '房型',
    key: 'factoryType',
  },
  {
    title: '地址',
    key: 'url',
  },
  {
    title: '描述',
    key: 'desc',
  },
];
